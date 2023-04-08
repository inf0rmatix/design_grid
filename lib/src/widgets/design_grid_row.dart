import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

abstract class DesignGridRow<T extends DesignGridItemWidget> extends StatelessWidget {
  /// The horizontal alignment of the items.
  final DesignGridRowAlignment alignment;

  final List<T> children;

  const DesignGridRow({
    super.key,
    this.alignment = DesignGridRowAlignment.start,
    required this.children,
  });

  double getColumnSpacing(BuildContext context);

  double getRowSpacing(BuildContext context);

  int getItemColumns(BuildContext context, T item);

  Widget buildChild(int columns, double width, T child);

  @override
  Widget build(BuildContext context) {
    final columnSpacing = getColumnSpacing(context);

    final rowSpacing = getRowSpacing(context);

    final columnSizes = DesignGridColumnSizes.of(context);

    final columns = columnSizes.length;

    final sizedChildren = <Widget>[];

    var columnCounter = 0;

    for (final child in children) {
      final isChildBreak = child is DesignGridItemBreak;

      // ignore the break if we are at the start of the row
      if (columnCounter == 0 && isChildBreak) {
        continue;
      }

      var childColumns = isChildBreak ? columns - columnCounter : getItemColumns(context, child);

      // make sure the child columns don't overflow the total columns
      childColumns = childColumns.clamp(0, columns);

      // don't display children with "invisible" column-span
      if (childColumns <= 0) {
        continue;
      }

      // if the child columns would overflow the current row, start a new one by setting columnCounter to zero
      if (columnCounter + childColumns > columns) {
        columnCounter = 0;
      }

      double childSize = DesignGridCalculator.calculateChildSize(
        columnSizes: columnSizes,
        columnCounter: columnCounter,
        childColumns: childColumns,
        columnSpacing: columnSpacing,
      );

      columnCounter += childColumns;

      final childWidget = KeyedSubtree.wrap(
        buildChild(childColumns, childSize, child),
        children.indexOf(child),
      );

      sizedChildren.add(childWidget);
    }

    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: alignment.toWrapAlignment(),
        spacing: columnSpacing,
        runSpacing: rowSpacing,
        children: sizedChildren,
      ),
    );
  }
}

import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

class MaterialDesignGridRow extends DesignGridRow<MaterialDesignGridItemWidget> {
  const MaterialDesignGridRow({
    super.key,
    super.alignment = DesignGridRowAlignment.start,
    required super.children,
  });

  @override
  double getRowSpacing(BuildContext context) {
    return MaterialDesignGridTheme.of(context).rowSpacing;
  }

  @override
  double getColumnSpacing(BuildContext context) {
    return MaterialDesignGridTheme.of(context).columnSpacing;
  }

  @override
  int getItemColumns(BuildContext context, MaterialDesignGridItemWidget item) {
    return item.getColumns(null);
  }

  @override
  Widget buildChild(int columns, double width, Widget child) {
    return MaterialDesignGridItemData(
      width: width,
      child: child,
    );
  }
}

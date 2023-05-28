import 'package:design_grid/design_grid.dart';
import 'package:design_grid/src/enums/design_grid_layout_type.dart';
import 'package:flutter/widgets.dart';

class ResponsiveDesignGridBuilder extends StatelessWidget {
  final DesignGridRowAlignment defaultRowAlignment;

  final bool useOuterPadding;

  final double width;

  final DesignGridLayoutType layoutType;

  final bool shrinkWrap;

  final List<ResponsiveDesignGridRow> children;

  const ResponsiveDesignGridBuilder({
    super.key,
    required this.defaultRowAlignment,
    required this.useOuterPadding,
    required this.width,
    required this.layoutType,
    required this.shrinkWrap,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ResponsiveDesignGridTheme.maybeOf(context) ?? const ResponsiveDesignGridThemeData();

    final availableWidth = useOuterPadding ? width - theme.gridPadding * 2 : width;

    final columnSizes = DesignGridCalculator.calculateColumnSizes(availableWidth, theme.columns, theme.columnSpacing);

    final effectiveChildren = children
        .expand((child) => [
              child,
              if (children.last != child)
                SizedBox(
                  height: theme.rowSpacing,
                ),
            ])
        .toList();

    Widget layout;

    switch (layoutType) {
      case DesignGridLayoutType.column:
        layout = Column(
          children: effectiveChildren,
        );

        break;
      case DesignGridLayoutType.listView:
        layout = ListView(
          shrinkWrap: shrinkWrap,
          children: effectiveChildren,
        );

        break;
    }

    return DesignGridDefaultRowAlignment(
      alignment: defaultRowAlignment,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: useOuterPadding ? theme.gridPadding : 0),
        child: DesignGridColumnSizes(
          sizes: columnSizes,
          child: SizedBox(
            width: availableWidth,
            child: layout,
          ),
        ),
      ),
    );
  }
}

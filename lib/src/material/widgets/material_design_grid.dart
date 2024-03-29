// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:design_grid/design_grid.dart';
import 'package:design_grid/src/enums/design_grid_layout_type.dart';
import 'package:flutter/widgets.dart';

class MaterialDesignGrid extends StatelessWidget {
  /// Set to [true] if this [MaterialDesignGrid] widget is top level and has the full horizontal space of the window/application.
  /// This is good for performance, by default this is [false] and uses [LayoutBuilder] to estimate the available horizontal space.
  final bool hasFullWindowWidth;

  final DesignGridRowAlignment defaultRowAlignment;

  final DesignGridLayoutType layoutType;

  /// Whether to shrink wrap the grid or not. If true, the grid will be as small as possible.
  /// This is bad for performance, so use it only if necessary.
  /// Also only works with [DesignGridLayoutType.listView]
  final bool shrinkWrap;

  final List<MaterialDesignGridRow> children;

  const MaterialDesignGrid({
    super.key,
    this.hasFullWindowWidth = false,
    this.defaultRowAlignment = DesignGridRowAlignment.start,
    this.layoutType = DesignGridLayoutType.column,
    this.shrinkWrap = false,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    if (hasFullWindowWidth) {
      return _MaterialDesignGridLayout(
        width: MediaQuery.of(context).size.width,
        defaultRowAlignment: defaultRowAlignment,
        layoutType: layoutType,
        shrinkWrap: shrinkWrap,
        children: children,
      );
    }

    // Avoid using LayoutBuilder if possible, because it will rebuild the whole grid on every change and is bad for performance.
    return LayoutBuilder(
      builder: (context, constraints) {
        return _MaterialDesignGridLayout(
          width: constraints.biggest.width,
          defaultRowAlignment: defaultRowAlignment,
          layoutType: layoutType,
          shrinkWrap: shrinkWrap,
          children: children,
        );
      },
    );
  }
}

class _MaterialDesignGridLayout extends StatelessWidget {
  final double width;

  final DesignGridRowAlignment defaultRowAlignment;

  final DesignGridLayoutType layoutType;

  final bool shrinkWrap;

  final List<MaterialDesignGridRow> children;

  const _MaterialDesignGridLayout({
    required this.width,
    required this.defaultRowAlignment,
    required this.layoutType,
    required this.shrinkWrap,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = MaterialDesignGridTheme.maybeOf(context) ?? const MaterialDesignGridThemeData();

    final breakpoints = theme.breakpoints;

    final columns = breakpoints.getColumns(width);

    final margin = breakpoints.getMargin(width);

    var bodyWidth = breakpoints.getBodyWidth(width);

    final availableWidth = bodyWidth ?? (width - (margin ?? 0) * 2);

    final columnSizes = DesignGridCalculator.calculateColumnSizes(availableWidth, columns, theme.columnSpacing);

    bodyWidth = bodyWidth ?? availableWidth;

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
        padding: EdgeInsets.symmetric(horizontal: margin ?? 0),
        child: DesignGridColumnSizes(
          sizes: columnSizes,
          child: Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: bodyWidth,
              child: layout,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

class ResponsiveDesignGridBuilder extends StatelessWidget {
  final DesignGridAlignment alignment;

  final bool useOuterPadding;

  final double width;

  final List<ResponsiveDesignGridRow> children;

  const ResponsiveDesignGridBuilder({
    super.key,
    required this.alignment,
    required this.useOuterPadding,
    required this.width,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ResponsiveDesignGridTheme.maybeOf(context) ?? const ResponsiveDesignGridThemeData();

    final availableWidth = useOuterPadding ? width - theme.gridPadding * 2 : width;

    final columnSizes = DesignGridCalculator.calculateColumnSizes(availableWidth, theme.columns, theme.columnSpacing);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: useOuterPadding ? theme.gridPadding : 0),
      child: DesignGridColumnSizes(
        sizes: columnSizes,
        child: SizedBox(
          width: availableWidth,
          child: Column(
            crossAxisAlignment: alignment.toCrossAxisAlignment(),
            children: children
                .expand((child) => [
                      child,
                      if (children.last != child)
                        SizedBox(
                          height: theme.rowSpacing,
                        ),
                    ])
                .toList(),
          ),
        ),
      ),
    );
  }
}

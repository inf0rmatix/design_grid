import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';

class ResponsiveDesignGridDebugOverlay extends DesignGridDebugOverlay {
  final bool? shouldCalculateLayout;

  final bool useOuterPadding;

  const ResponsiveDesignGridDebugOverlay({
    super.key,
    super.isVisible,
    super.enableControls,
    super.isInBackground,
    this.shouldCalculateLayout,
    this.useOuterPadding = true,
    required super.child,
  });

  @override
  Widget overlayBuilder(BuildContext context, Size size) {
    final transparentColor = color.withAlpha(30);

    final designGridTheme = ResponsiveDesignGridTheme.maybeOf(context) ?? const ResponsiveDesignGridThemeData();

    return ResponsiveDesignGrid(
      shouldCalculateLayout: shouldCalculateLayout,
      useOuterPadding: useOuterPadding,
      children: [
        ResponsiveDesignGridRow(
          children: List.generate(
            designGridTheme.columns,
            (_) => ResponsiveDesignGridItem(
              columns: const ResponsiveDesignGridColumns(small: 1),
              child: Container(
                height: size.height,
                color: transparentColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

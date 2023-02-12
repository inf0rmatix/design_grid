import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';

class MaterialDesignGridDebugOverlay extends DesignGridDebugOverlay {
  const MaterialDesignGridDebugOverlay({
    super.key,
    super.isVisible,
    super.enableControls,
    super.isInBackground,
    required super.child,
  });

  @override
  Widget overlayBuilder(BuildContext context, Size size) {
    final transparentColor = color.withAlpha(30);

    final theme = MaterialDesignGridTheme.of(context);

    return MaterialDesignGrid(
      children: [
        MaterialDesignGridRow(
          children: [
            for (var i = 0; i < theme.breakpoints.getColumns(size.width); i++)
              MaterialDesignGridItem(
                columns: 1,
                child: Container(
                  color: transparentColor,
                  height: size.height,
                ),
              ),
          ],
        ),
      ],
    );
  }
}

import 'package:alchemist/alchemist.dart';
import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'golden_helper.dart';

void main() {
  group('Responsive Design Grid Debug Overlay', () {
    goldenTest(
      'should layout properly for all breakpoints',
      fileName: 'responsive_design_grid_debug_overlay',
      // TODO(inf0rmatix): currently disabled on CI since there is a bug which throws an error with 0.00% pixel difference
      skip: const String.fromEnvironment('CI') == 'true',
      builder: () => Column(
        children: [
          ...responsiveBreakpointScenarios(
            child: DecoratedBox(
              decoration: BoxDecoration(border: Border.all()),
              child: ResponsiveDesignGridConfig(
                child: ResponsiveDesignGridDebugOverlay(
                  isVisible: true,
                  child: Container(
                    height: 100,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  });
}

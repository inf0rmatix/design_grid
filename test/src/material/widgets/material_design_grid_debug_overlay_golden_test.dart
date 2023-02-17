import 'package:alchemist/alchemist.dart';
import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Material Design Grid Debug Overlay', () {
    goldenTest(
      'should work on all breakpoints',
      fileName: 'material_design_grid_debug_overlay',
      builder: () => MaterialDesignGridTheme(
        child: Column(
          children: [
            GoldenTestScenario(
              name: 'extra small (phone)',
              constraints: const BoxConstraints(maxWidth: 599),
              child: const _MaterialDesignGridDebugOverlayForTest(),
            ),
            GoldenTestScenario(
              name: 'small (tablet)',
              constraints: const BoxConstraints(maxWidth: 904),
              child: const _MaterialDesignGridDebugOverlayForTest(),
            ),
            GoldenTestScenario(
              name: 'small (tablet)',
              constraints: const BoxConstraints(maxWidth: 1239),
              child: const _MaterialDesignGridDebugOverlayForTest(),
            ),
            GoldenTestScenario(
              name: 'medium (laptop)',
              constraints: const BoxConstraints(maxWidth: 1439),
              child: const _MaterialDesignGridDebugOverlayForTest(),
            ),
            GoldenTestScenario(
              name: 'large (desktop)',
              constraints: const BoxConstraints(maxWidth: 1600),
              child: const _MaterialDesignGridDebugOverlayForTest(),
            ),
          ],
        ),
      ),
    );
  });
}

class _MaterialDesignGridDebugOverlayForTest extends StatelessWidget {
  const _MaterialDesignGridDebugOverlayForTest();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(border: Border.all()),
      child: MaterialDesignGridTheme(
        child: MaterialDesignGridDebugOverlay(
          child: Container(
            height: 100,
          ),
        ),
      ),
    );
  }
}

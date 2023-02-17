import 'package:alchemist/alchemist.dart';
import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Material Design Grid Item Break', () {
    goldenTest(
      'should end the visual row',
      fileName: 'material_design_grid_item_break',
      builder: () => MaterialDesignGridTheme(
        child: Column(
          children: [
            GoldenTestScenario(
              name: 'extra small (phone)',
              constraints: const BoxConstraints(maxWidth: 599),
              child: const _MaterialDesignGridItemBreakForTest(),
            ),
            GoldenTestScenario(
              name: 'small (tablet)',
              constraints: const BoxConstraints(maxWidth: 904),
              child: const _MaterialDesignGridItemBreakForTest(),
            ),
            GoldenTestScenario(
              name: 'small (tablet)',
              constraints: const BoxConstraints(maxWidth: 1239),
              child: const _MaterialDesignGridItemBreakForTest(),
            ),
            GoldenTestScenario(
              name: 'medium (laptop)',
              constraints: const BoxConstraints(maxWidth: 1439),
              child: const _MaterialDesignGridItemBreakForTest(),
            ),
            GoldenTestScenario(
              name: 'large (desktop)',
              constraints: const BoxConstraints(maxWidth: 1600),
              child: const _MaterialDesignGridItemBreakForTest(),
            ),
          ],
        ),
      ),
    );
  });
}

class _MaterialDesignGridItemBreakForTest extends StatelessWidget {
  const _MaterialDesignGridItemBreakForTest();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(border: Border.all()),
      child: MaterialDesignGridTheme(
        child: MaterialDesignGrid(
          children: [
            MaterialDesignGridRow(
              children: [
                MaterialDesignGridItem(
                  columns: 2,
                  child: Container(
                    height: 50,
                    color: Colors.amber,
                  ),
                ),
                const MaterialDesignGridItemBreak(),
                MaterialDesignGridItem(
                  columns: 2,
                  child: Container(
                    height: 50,
                    color: Colors.amber,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

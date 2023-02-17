import 'package:alchemist/alchemist.dart';
import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'golden_helper.dart';

void main() {
  group('Responsive Design Grid', () {
    const testDesignGridThemeData = ResponsiveDesignGridThemeData(
      gridPadding: 16.0,
      columnSpacing: 16.0,
      rowSpacing: 16.0,
      columns: 12,
    );

    goldenTest(
      'should do a basic column layout for all sizes',
      fileName: 'responsive_design_grid_basic_column_layout',
      constraints: BoxConstraints(maxWidth: breakpoints.extraLarge),
      builder: () {
        return ResponsiveDesignGridConfig(
          theme: testDesignGridThemeData,
          child: Wrap(
            children: [
              ...responsiveBreakpointScenarios(
                child: const _ResponsiveDesignGridForTest(),
              ),
            ],
          ),
        );
      },
    );

    goldenTest(
      'should use row alignment properly',
      fileName: 'responsive_design_grid_row_alignment',
      constraints: const BoxConstraints(maxWidth: 1600),
      builder: () => ResponsiveDesignGridConfig(
        child: Column(
          children: [
            GoldenTestScenario(
              name: 'start',
              child: const _ResponsiveDesignGridForRowAlignmentTest(DesignGridRowAlignment.start),
            ),
            GoldenTestScenario(
              name: 'center',
              child: const _ResponsiveDesignGridForRowAlignmentTest(DesignGridRowAlignment.center),
            ),
            GoldenTestScenario(
              name: 'end',
              child: const _ResponsiveDesignGridForRowAlignmentTest(DesignGridRowAlignment.end),
            ),
            GoldenTestScenario(
              name: 'space-between',
              child: const _ResponsiveDesignGridForRowAlignmentTest(DesignGridRowAlignment.spaceBetween),
            ),
            GoldenTestScenario(
              name: 'space-around',
              child: const _ResponsiveDesignGridForRowAlignmentTest(DesignGridRowAlignment.spaceAround),
            ),
            GoldenTestScenario(
              name: 'space-evenly',
              child: const _ResponsiveDesignGridForRowAlignmentTest(DesignGridRowAlignment.spaceEvenly),
            ),
          ],
        ),
      ),
    );

    goldenTest(
      'should use breaks',
      constraints: BoxConstraints(maxWidth: breakpoints.extraLarge),
      fileName: 'responsive_design_grid_breaks',
      builder: () {
        return GoldenTestScenario(
          name: 'breaks',
          child: ResponsiveDesignGridConfig(
            child: ResponsiveDesignGrid(
              children: [
                ResponsiveDesignGridRow(
                  children: [
                    ResponsiveDesignGridItem(
                      columns: const ResponsiveDesignGridColumns(small: 6),
                      child: _GridChildLabel(),
                    ),
                    const ResponsiveDesignGridItemBreak(),
                    ResponsiveDesignGridItem(
                      columns: const ResponsiveDesignGridColumns(small: 6),
                      child: _GridChildLabel(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

    goldenTest(
      'should work with nested design grids',
      fileName: 'responsive_design_grid_nested_design_grid',
      constraints: BoxConstraints(maxWidth: breakpoints.extraLarge),
      builder: () {
        return GoldenTestScenario(
          name: 'nested design grid',
          child: MediaQuery(
            data: const MediaQueryData(size: Size(1540, 1080)),
            child: ResponsiveDesignGridConfig(
              theme: testDesignGridThemeData,
              child: ResponsiveDesignGrid(
                children: [
                  ResponsiveDesignGridRow(
                    children: [
                      ResponsiveDesignGridItem(
                        columns: const ResponsiveDesignGridColumns(small: 12),
                        child: Container(
                          color: Colors.black26,
                          child: Wrap(
                            runSpacing: 16.0,
                            children: [
                              _GridChildLabel(),
                              ResponsiveDesignGrid(
                                children: [
                                  ResponsiveDesignGridRow(
                                    children: [
                                      ResponsiveDesignGridItem(
                                        columns: const ResponsiveDesignGridColumns(small: 6),
                                        child: Container(
                                          color: Colors.black26,
                                          child: Wrap(
                                            runSpacing: 16.0,
                                            children: [
                                              _GridChildLabel(),
                                              ResponsiveDesignGrid(
                                                children: [
                                                  ResponsiveDesignGridRow(
                                                    children: [
                                                      ResponsiveDesignGridItem(
                                                        columns: const ResponsiveDesignGridColumns(small: 4),
                                                        child: Container(
                                                          color: Colors.black26,
                                                          child: Wrap(
                                                            runSpacing: 16.0,
                                                            children: [
                                                              _GridChildLabel(),
                                                              ResponsiveDesignGrid(
                                                                children: [
                                                                  ResponsiveDesignGridRow(
                                                                    children: [
                                                                      ResponsiveDesignGridItem(
                                                                        columns:
                                                                            const ResponsiveDesignGridColumns(small: 6),
                                                                        child: Column(
                                                                          children: [
                                                                            _GridChildLabel(),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      ResponsiveDesignGridItem(
                                                                        columns:
                                                                            const ResponsiveDesignGridColumns(small: 6),
                                                                        child: _GridChildLabel(),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      ResponsiveDesignGridItem(
                                                        columns: const ResponsiveDesignGridColumns(small: 8),
                                                        child: _GridChildLabel(),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      ResponsiveDesignGridItem(
                                        columns: const ResponsiveDesignGridColumns(small: 6),
                                        child: _GridChildLabel(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    goldenTest(
      'should work for a known edge-case of 1540px',
      fileName: 'responsive_design_grid_1540px',
      builder: () => GoldenTestScenario(
        name: 'edge case width of 1540px',
        child: ResponsiveDesignGridConfig(
          theme: testDesignGridThemeData,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1540),
            child: const _ResponsiveDesignGridForTest(),
          ),
        ),
      ),
    );
  });
}

class _ResponsiveDesignGridForTest extends StatelessWidget {
  const _ResponsiveDesignGridForTest();

  @override
  Widget build(BuildContext context) {
    const columnSizeExamples = [12, 6, 4, 3, 2, 1];

    return ResponsiveDesignGrid(
      children: [
        for (final columns in columnSizeExamples)
          ResponsiveDesignGridRow(
            children: [
              ...List.generate(
                12 ~/ columns,
                (_) => ResponsiveDesignGridItem(
                  columns: ResponsiveDesignGridColumns(small: columns),
                  child: _GridChildLabel(),
                ),
              ),
            ],
          ),
      ],
    );
  }
}

class _ResponsiveDesignGridForRowAlignmentTest extends StatelessWidget {
  final DesignGridRowAlignment alignment;

  const _ResponsiveDesignGridForRowAlignmentTest(this.alignment);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(border: Border.all()),
      child: ResponsiveDesignGridConfig(
        child: ResponsiveDesignGrid(
          children: [
            ResponsiveDesignGridRow(
              alignment: alignment,
              children: [
                ResponsiveDesignGridItem(
                  columns: const ResponsiveDesignGridColumns(small: 2),
                  child: _GridChildLabel(),
                ),
                ResponsiveDesignGridItem(
                  columns: const ResponsiveDesignGridColumns(small: 2),
                  child: _GridChildLabel(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _GridChildLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gridChildData = ResponsiveDesignGridItemData.of(context);
    final columns = gridChildData.columns;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          '$columns / 12',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

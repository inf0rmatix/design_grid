import 'package:alchemist/alchemist.dart';
import 'package:design_grid/design_grid.dart';
import 'package:design_grid/src/enums/design_grid_layout_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Material Design Grid',
    () {
      goldenTest(
        'should work on all breakpoints',
        fileName: 'material_design_grid_breakpoints',
        builder: () => MaterialDesignGridTheme(
          child: Column(
            children: [
              GoldenTestScenario(
                name: 'extra small (phone)',
                constraints: const BoxConstraints(maxWidth: 599),
                child: const _MaterialDesignGridForGeneralTest(),
              ),
              GoldenTestScenario(
                name: 'small (tablet)',
                constraints: const BoxConstraints(maxWidth: 904),
                child: const _MaterialDesignGridForGeneralTest(),
              ),
              GoldenTestScenario(
                name: 'small (tablet)',
                constraints: const BoxConstraints(maxWidth: 1239),
                child: const _MaterialDesignGridForGeneralTest(),
              ),
              GoldenTestScenario(
                name: 'medium (laptop)',
                constraints: const BoxConstraints(maxWidth: 1439),
                child: const _MaterialDesignGridForGeneralTest(),
              ),
              GoldenTestScenario(
                name: 'large (desktop)',
                constraints: const BoxConstraints(maxWidth: 1600),
                child: const _MaterialDesignGridForGeneralTest(),
              ),
            ],
          ),
        ),
      );

      goldenTest(
        'should work with listView constructor',
        fileName: 'material_design_grid_breakpoints_list_view',
        builder: () => MaterialDesignGridTheme(
          child: Column(
            children: [
              GoldenTestScenario(
                name: 'extra small (phone)',
                constraints: const BoxConstraints(maxWidth: 599),
                child: const _MaterialDesignGridForGeneralTest(
                  layoutType: DesignGridLayoutType.listView,
                ),
              ),
              GoldenTestScenario(
                name: 'small (tablet)',
                constraints: const BoxConstraints(maxWidth: 904),
                child: const _MaterialDesignGridForGeneralTest(
                  layoutType: DesignGridLayoutType.listView,
                ),
              ),
              GoldenTestScenario(
                name: 'small (tablet)',
                constraints: const BoxConstraints(maxWidth: 1239),
                child: const _MaterialDesignGridForGeneralTest(
                  layoutType: DesignGridLayoutType.listView,
                ),
              ),
              GoldenTestScenario(
                name: 'medium (laptop)',
                constraints: const BoxConstraints(maxWidth: 1439),
                child: const _MaterialDesignGridForGeneralTest(
                  layoutType: DesignGridLayoutType.listView,
                ),
              ),
              GoldenTestScenario(
                name: 'large (desktop)',
                constraints: const BoxConstraints(maxWidth: 1600),
                child: const _MaterialDesignGridForGeneralTest(
                  layoutType: DesignGridLayoutType.listView,
                ),
              ),
            ],
          ),
        ),
      );

      goldenTest(
        'should use MediaQuery instead of LayoutBuilder of hasFullWindowWidth=true',
        fileName: 'material_design_grid_media_query',
        builder: () => MaterialDesignGridTheme(
          child: Column(
            children: [
              GoldenTestScenario(
                name: 'extra small (phone)',
                constraints: const BoxConstraints(maxWidth: 599),
                child: const MediaQuery(
                  data: MediaQueryData(size: Size(599, 800)),
                  child: _MaterialDesignGridForGeneralTest(hasFullWindowWidth: true),
                ),
              ),
              GoldenTestScenario(
                name: 'small (tablet)',
                constraints: const BoxConstraints(maxWidth: 904),
                child: const MediaQuery(
                  data: MediaQueryData(size: Size(904, 800)),
                  child: _MaterialDesignGridForGeneralTest(hasFullWindowWidth: true),
                ),
              ),
              GoldenTestScenario(
                name: 'small (tablet)',
                constraints: const BoxConstraints(maxWidth: 1239),
                child: const MediaQuery(
                  data: MediaQueryData(size: Size(1239, 800)),
                  child: _MaterialDesignGridForGeneralTest(hasFullWindowWidth: true),
                ),
              ),
              GoldenTestScenario(
                name: 'medium (laptop)',
                constraints: const BoxConstraints(maxWidth: 1439),
                child: const MediaQuery(
                  data: MediaQueryData(size: Size(1439, 800)),
                  child: _MaterialDesignGridForGeneralTest(hasFullWindowWidth: true),
                ),
              ),
              GoldenTestScenario(
                name: 'large (desktop)',
                constraints: const BoxConstraints(maxWidth: 1600),
                child: const MediaQuery(
                  data: MediaQueryData(size: Size(1600, 800)),
                  child: _MaterialDesignGridForGeneralTest(hasFullWindowWidth: true),
                ),
              ),
            ],
          ),
        ),
      );

      goldenTest(
        'should layout correctly for half-empty rows',
        fileName: 'material_design_grid_half_empty_rows',
        builder: () => MaterialDesignGridTheme(
          child: Column(
            children: [
              GoldenTestScenario(
                name: 'extra small (phone)',
                constraints: const BoxConstraints(maxWidth: 599),
                child: const _MaterialDesignGridForHalfEmptyRowTest(),
              ),
              GoldenTestScenario(
                name: 'small (tablet)',
                constraints: const BoxConstraints(maxWidth: 904),
                child: const _MaterialDesignGridForHalfEmptyRowTest(),
              ),
              GoldenTestScenario(
                name: 'small (tablet)',
                constraints: const BoxConstraints(maxWidth: 1239),
                child: const _MaterialDesignGridForHalfEmptyRowTest(),
              ),
              GoldenTestScenario(
                name: 'medium (laptop)',
                constraints: const BoxConstraints(maxWidth: 1439),
                child: const _MaterialDesignGridForHalfEmptyRowTest(),
              ),
              GoldenTestScenario(
                name: 'large (desktop)',
                constraints: const BoxConstraints(maxWidth: 1600),
                child: const _MaterialDesignGridForHalfEmptyRowTest(),
              ),
            ],
          ),
        ),
      );

      goldenTest(
        'should use row alignment properly',
        fileName: 'material_design_grid_row_alignment',
        constraints: const BoxConstraints(maxWidth: 1600),
        builder: () => MaterialDesignGridTheme(
          child: Column(
            children: [
              GoldenTestScenario(
                name: 'start',
                child: const _MaterialDesignGridForRowAlignmentTest(DesignGridRowAlignment.start),
              ),
              GoldenTestScenario(
                name: 'center',
                child: const _MaterialDesignGridForRowAlignmentTest(DesignGridRowAlignment.center),
              ),
              GoldenTestScenario(
                name: 'end',
                child: const _MaterialDesignGridForRowAlignmentTest(DesignGridRowAlignment.end),
              ),
              GoldenTestScenario(
                name: 'space-between',
                child: const _MaterialDesignGridForRowAlignmentTest(DesignGridRowAlignment.spaceBetween),
              ),
              GoldenTestScenario(
                name: 'space-around',
                child: const _MaterialDesignGridForRowAlignmentTest(DesignGridRowAlignment.spaceAround),
              ),
              GoldenTestScenario(
                name: 'space-evenly',
                child: const _MaterialDesignGridForRowAlignmentTest(DesignGridRowAlignment.spaceEvenly),
              ),
            ],
          ),
        ),
      );
    },
  );
}

class _MaterialDesignGridForRowAlignmentTest extends StatelessWidget {
  final DesignGridRowAlignment alignment;

  const _MaterialDesignGridForRowAlignmentTest(this.alignment);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(border: Border.all()),
      child: MaterialDesignGrid(
        children: [
          MaterialDesignGridRow(
            alignment: alignment,
            children: const [
              MaterialDesignGridItem(
                columns: 2,
                child: _GridChildLabel(columns: 2),
              ),
              MaterialDesignGridItem(
                columns: 2,
                child: _GridChildLabel(columns: 2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MaterialDesignGridForHalfEmptyRowTest extends StatelessWidget {
  const _MaterialDesignGridForHalfEmptyRowTest();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(border: Border.all()),
      child: const MaterialDesignGrid(
        children: [
          MaterialDesignGridRow(
            children: [
              MaterialDesignGridItem(
                columns: 4,
                child: _GridChildLabel(columns: 4),
              ),
            ],
          ),
          MaterialDesignGridRow(
            children: [
              MaterialDesignGridItem(
                columns: 3,
                child: _GridChildLabel(columns: 3),
              ),
            ],
          ),
          MaterialDesignGridRow(
            children: [
              MaterialDesignGridItem(
                columns: 2,
                child: _GridChildLabel(columns: 2),
              ),
            ],
          ),
          MaterialDesignGridRow(
            children: [
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MaterialDesignGridForGeneralTest extends StatelessWidget {
  final DesignGridLayoutType layoutType;

  final bool hasFullWindowWidth;

  const _MaterialDesignGridForGeneralTest({
    this.layoutType = DesignGridLayoutType.column,
    this.hasFullWindowWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(border: Border.all()),
      child: MaterialDesignGrid(
        layoutType: layoutType,
        shrinkWrap: true,
        hasFullWindowWidth: hasFullWindowWidth,
        children: const [
          MaterialDesignGridRow(
            children: [
              MaterialDesignGridItem(
                columns: 4,
                child: _GridChildLabel(columns: 4),
              ),
              MaterialDesignGridItem(
                columns: 4,
                child: _GridChildLabel(columns: 4),
              ),
              MaterialDesignGridItem(
                columns: 4,
                child: _GridChildLabel(columns: 4),
              ),
            ],
          ),
          MaterialDesignGridRow(
            children: [
              MaterialDesignGridItem(
                columns: 2,
                child: _GridChildLabel(columns: 2),
              ),
              MaterialDesignGridItem(
                columns: 2,
                child: _GridChildLabel(columns: 2),
              ),
              MaterialDesignGridItem(
                columns: 2,
                child: _GridChildLabel(columns: 2),
              ),
              MaterialDesignGridItem(
                columns: 2,
                child: _GridChildLabel(columns: 2),
              ),
              MaterialDesignGridItem(
                columns: 2,
                child: _GridChildLabel(columns: 2),
              ),
              MaterialDesignGridItem(
                columns: 2,
                child: _GridChildLabel(columns: 2),
              ),
            ],
          ),
          MaterialDesignGridRow(
            children: [
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
              MaterialDesignGridItem(
                columns: 1,
                child: _GridChildLabel(columns: 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GridChildLabel extends StatelessWidget {
  final int columns;

  const _GridChildLabel({
    required this.columns,
  });

  @override
  Widget build(BuildContext context) {
    final totalColumns = DesignGridColumnSizes.of(context).length;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          '$columns / $totalColumns',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

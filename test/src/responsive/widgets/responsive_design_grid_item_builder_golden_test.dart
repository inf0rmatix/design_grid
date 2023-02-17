import 'package:alchemist/alchemist.dart';
import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Responsive Design Grid Item Builder', () {
    goldenTest(
      'should build',
      fileName: 'responsive_design_grid_item_builder',
      builder: () => ResponsiveDesignGridItemData(
        columns: 2,
        width: 100,
        child: ResponsiveDesignGridItemBuilder(
          columns: const ResponsiveDesignGridColumns(
            small: 2,
          ),
          builder: (context, columns, width) => Container(
            height: 100,
            width: width,
            color: Colors.amber,
          ),
        ),
      ),
    );
  });
}

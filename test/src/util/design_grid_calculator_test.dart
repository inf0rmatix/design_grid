import 'package:design_grid/design_grid.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Design Grid Calculator', () {
    test('should calculate column width accurately so that all columns summarized don\'t overflow', () {
      const theme = ResponsiveDesignGridThemeData();

      const testSizes = <double>[768, 1024, 1280, 1366, 1440, 1600, 1920, 2560, 3840, 1250.64234127];

      for (final size in testSizes) {
        final width = size;

        final columnSizes = DesignGridCalculator.calculateColumnSizes(width, theme.columns, theme.columnSpacing);

        final totalColumnWidth = columnSizes.reduce((value, element) => value += element);

        final totalWidth = totalColumnWidth + (theme.columns - 1) * theme.columnSpacing;

        expect(totalWidth, width);
      }
    });

    test('should calculate child size', () {
      const columnSizes = <double>[42, 42, 42, 42];

      const columnSpacing = 16.0;

      expect(
        DesignGridCalculator.calculateChildSize(
          columnSizes: columnSizes,
          columnCounter: 0,
          childColumns: 4,
          columnSpacing: columnSpacing,
        ),
        42 * 4 + columnSpacing * 3,
      );

      expect(
        DesignGridCalculator.calculateChildSize(
          columnSizes: columnSizes,
          columnCounter: 1,
          childColumns: 1,
          columnSpacing: columnSpacing,
        ),
        42,
      );

      expect(
        DesignGridCalculator.calculateChildSize(
          columnSizes: columnSizes,
          columnCounter: 3,
          childColumns: 1,
          columnSpacing: columnSpacing,
        ),
        42,
      );
    });
  });
}

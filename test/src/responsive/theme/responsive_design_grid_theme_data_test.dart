import 'package:design_grid/design_grid.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Responsive Design Grid Theme Data', () {
    test('should assert correct values in constructor', () {
      expect(
        () => ResponsiveDesignGridThemeData(columns: 0),
        throwsAssertionError,
      );

      expect(
        () => ResponsiveDesignGridThemeData(gridPadding: 0.5),
        throwsAssertionError,
      );

      expect(
        () => ResponsiveDesignGridThemeData(columnSpacing: 0.5),
        throwsAssertionError,
      );

      expect(
        () => ResponsiveDesignGridThemeData(rowSpacing: 0.5),
        throwsAssertionError,
      );
    });

    test('should check equality', () {
      const ResponsiveDesignGridThemeData themeData = ResponsiveDesignGridThemeData();
      const ResponsiveDesignGridThemeData themeData2 = ResponsiveDesignGridThemeData();

      const ResponsiveDesignGridThemeData themeData3 = ResponsiveDesignGridThemeData(
        columns: 10,
        columnSpacing: 10,
        rowSpacing: 10,
        gridPadding: 10,
      );

      expect(themeData == themeData2, isTrue);
      expect(themeData == themeData3, isFalse);
    });

    test('should provide hashcode', () {
      const ResponsiveDesignGridThemeData themeData = ResponsiveDesignGridThemeData();
      const ResponsiveDesignGridThemeData themeData2 = ResponsiveDesignGridThemeData();

      expect(themeData.hashCode, equals(themeData2.hashCode));
    });
  });
}

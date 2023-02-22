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

      expect(themeData == themeData2, isTrue);
      expect(themeData == const ResponsiveDesignGridThemeData(columns: 10), isFalse);
      expect(themeData == const ResponsiveDesignGridThemeData(columnSpacing: 10), isFalse);
      expect(themeData == const ResponsiveDesignGridThemeData(rowSpacing: 10), isFalse);
      expect(themeData == const ResponsiveDesignGridThemeData(gridPadding: 10), isFalse);
    });

    test('should provide hashcode', () {
      const ResponsiveDesignGridThemeData themeData = ResponsiveDesignGridThemeData();
      const ResponsiveDesignGridThemeData themeData2 = ResponsiveDesignGridThemeData();

      expect(themeData.hashCode, equals(themeData2.hashCode));
    });
  });
}

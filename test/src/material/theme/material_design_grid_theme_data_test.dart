import 'package:design_grid/design_grid.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Material Design Grid Theme Data', () {
    test('should assert correct values in constructor', () {
      expect(() => MaterialDesignGridThemeData(columnSpacing: 16.5), throwsAssertionError);
      expect(() => MaterialDesignGridThemeData(rowSpacing: 16.5), throwsAssertionError);
    });

    test('should check equality', () {
      const themeData = MaterialDesignGridThemeData();

      expect(themeData == themeData, isTrue);
      expect(themeData, isNot(const MaterialDesignGridThemeData(breakpoints: _DifferentBreakpoints())));
      expect(themeData, isNot(const MaterialDesignGridThemeData(columnSpacing: 0)));
      expect(themeData, isNot(const MaterialDesignGridThemeData(rowSpacing: 0)));
    });

    test('should check hash code', () {
      const themeData = MaterialDesignGridThemeData();

      final hashCode = themeData.hashCode;

      expect(hashCode, themeData.hashCode);
      expect(hashCode, isNot(const MaterialDesignGridThemeData(breakpoints: _DifferentBreakpoints()).hashCode));
      expect(hashCode, isNot(const MaterialDesignGridThemeData(columnSpacing: 0).hashCode));
      expect(hashCode, isNot(const MaterialDesignGridThemeData(rowSpacing: 0).hashCode));
    });
  });
}

class _DifferentBreakpoints extends MaterialDesignGridBreakpoints {
  const _DifferentBreakpoints();

  @override
  double? getBodyWidth(double width) {
    return 0;
  }
}

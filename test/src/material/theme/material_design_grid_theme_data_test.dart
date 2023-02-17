import 'package:design_grid/design_grid.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Material Design Grid Theme Data', () {
    test('should assert correct values in constructor', () {
      expect(() => MaterialDesignGridThemeData(columnSpacing: 16.5), throwsAssertionError);
      expect(() => MaterialDesignGridThemeData(rowSpacing: 16.5), throwsAssertionError);
    });
  });
}

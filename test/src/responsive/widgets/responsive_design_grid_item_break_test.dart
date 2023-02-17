import 'package:design_grid/design_grid.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Responsive Design Grid Item Break', () {
    test('should have zero columns', () {
      const ResponsiveDesignGridItemBreak responsiveDesignGridItemBreak = ResponsiveDesignGridItemBreak();

      expect(responsiveDesignGridItemBreak.columns.small, equals(0));
      expect(responsiveDesignGridItemBreak.columns.medium, equals(null));
      expect(responsiveDesignGridItemBreak.columns.large, equals(null));
      expect(responsiveDesignGridItemBreak.columns.extraLarge, equals(null));
    });
  });
}

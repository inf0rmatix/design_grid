import 'package:design_grid/design_grid.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Responsive Design Grid Columns', () {
    test('should get columns', () {
      const ResponsiveDesignGridColumns columns = ResponsiveDesignGridColumns(
        small: 4,
        large: 2,
      );

      expect(columns.getColumns(ResponsiveDesignGridDisplaySize.small), equals(4));
      expect(columns.getColumns(ResponsiveDesignGridDisplaySize.medium), equals(4));
      expect(columns.getColumns(ResponsiveDesignGridDisplaySize.large), equals(2));
      expect(columns.getColumns(ResponsiveDesignGridDisplaySize.extraLarge), equals(2));
    });
  });
}

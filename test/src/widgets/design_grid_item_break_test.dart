import 'package:design_grid/design_grid.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Design Grid Item Break', () {
    test('should get columns', () {
      const item = DesignGridItemBreak();

      expect(item.getColumns(null), 0);
    });
  });
}

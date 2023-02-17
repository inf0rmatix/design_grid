import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Responsive Design Grid Item Data', () {
    test('should notify on update', () {
      const oldWidget = ResponsiveDesignGridItemData(
        columns: 10,
        width: 10,
        child: Placeholder(),
      );

      const newWidget = ResponsiveDesignGridItemData(
        columns: 10,
        width: 1,
        child: Placeholder(),
      );

      expect(oldWidget.updateShouldNotify(newWidget), isTrue);
    });
  });
}

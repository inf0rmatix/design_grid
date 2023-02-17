import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Design Grid Column Sizes', () {
    test('should notify on update', () {
      const oldWidget = DesignGridColumnSizes(
        sizes: [1, 2, 3],
        child: Placeholder(),
      );

      const newWidget = DesignGridColumnSizes(
        sizes: [1, 2, 3, 4],
        child: Placeholder(),
      );

      expect(oldWidget.updateShouldNotify(newWidget), isTrue);
    });
  });
}

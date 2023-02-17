import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Material Design Grid Item Data', () {
    test('should notify on update', () {
      const data = MaterialDesignGridItemData(width: 1, child: Placeholder());
      const oldData = MaterialDesignGridItemData(width: 2, child: Placeholder());

      expect(data.updateShouldNotify(oldData), isTrue);
    });
  });
}

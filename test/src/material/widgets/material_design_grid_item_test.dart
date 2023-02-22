import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Material Design Grid Item', () {
    test('should build placeholder', () async {
      final placeholderItem = MaterialDesignGridItem.placeholder(columns: 1);

      expect(placeholderItem.child, isA<SizedBox>());
    });
  });
}

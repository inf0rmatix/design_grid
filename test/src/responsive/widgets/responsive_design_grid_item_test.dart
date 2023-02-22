import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Responsive Design Grid Item', () {
    test('should build placeholder', () async {
      final placeholderItem = ResponsiveDesignGridItem.placeholder(
        columns: const ResponsiveDesignGridColumns(
          large: 1,
          medium: 1,
          small: 1,
        ),
      );

      expect(placeholderItem.child, isA<SizedBox>());
    });
  });
}

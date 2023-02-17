import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Responsive Design Grid Item Builder', () {
    test('should get columns', () {
      const displaySize = ResponsiveDesignGridDisplaySize.small;

      final item = ResponsiveDesignGridItemBuilder(
        columns: const ResponsiveDesignGridColumns(
          small: 2,
        ),
        builder: (context, columns, width) => const Placeholder(),
      );

      expect(item.getColumns(displaySize), 2);
    });
  });
}

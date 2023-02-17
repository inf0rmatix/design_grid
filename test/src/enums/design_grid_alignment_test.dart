import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Design Grid Alignment', () {
    test('should properly map to CrossAxisAlignment', () {
      expect(DesignGridAlignment.start.toCrossAxisAlignment(), CrossAxisAlignment.start);
      expect(DesignGridAlignment.end.toCrossAxisAlignment(), CrossAxisAlignment.end);
      expect(DesignGridAlignment.center.toCrossAxisAlignment(), CrossAxisAlignment.center);
      expect(DesignGridAlignment.baseline.toCrossAxisAlignment(), CrossAxisAlignment.baseline);
    });
  });
}

import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Design Grid Row Alignment', () {
    test('should map to WrapAlignment', () {
      expect(DesignGridRowAlignment.center.toWrapAlignment(), equals(WrapAlignment.center));
      expect(DesignGridRowAlignment.end.toWrapAlignment(), equals(WrapAlignment.end));
      expect(DesignGridRowAlignment.start.toWrapAlignment(), equals(WrapAlignment.start));
      expect(DesignGridRowAlignment.spaceBetween.toWrapAlignment(), equals(WrapAlignment.spaceBetween));
      expect(DesignGridRowAlignment.spaceAround.toWrapAlignment(), equals(WrapAlignment.spaceAround));
      expect(DesignGridRowAlignment.spaceEvenly.toWrapAlignment(), equals(WrapAlignment.spaceEvenly));
    });

    test('should map to MainAxisAlignment', () {
      expect(DesignGridRowAlignment.center.toMainAxisAlignment(), equals(MainAxisAlignment.center));
      expect(DesignGridRowAlignment.end.toMainAxisAlignment(), equals(MainAxisAlignment.end));
      expect(DesignGridRowAlignment.start.toMainAxisAlignment(), equals(MainAxisAlignment.start));
      expect(DesignGridRowAlignment.spaceBetween.toMainAxisAlignment(), equals(MainAxisAlignment.spaceBetween));
      expect(DesignGridRowAlignment.spaceAround.toMainAxisAlignment(), equals(MainAxisAlignment.spaceAround));
      expect(DesignGridRowAlignment.spaceEvenly.toMainAxisAlignment(), equals(MainAxisAlignment.spaceEvenly));
    });
  });
}

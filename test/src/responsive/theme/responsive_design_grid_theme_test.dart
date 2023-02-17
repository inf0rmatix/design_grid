import 'package:design_grid/src/responsive/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Responsive Design Grid Theme Test', () {
    test('should notify on update', () {
      const oldWidget = ResponsiveDesignGridTheme(
        data: ResponsiveDesignGridThemeData(),
        child: Placeholder(),
      );

      const newWidget = ResponsiveDesignGridTheme(
        data: ResponsiveDesignGridThemeData(
          columns: 10,
          columnSpacing: 10,
          rowSpacing: 10,
          gridPadding: 10,
        ),
        child: Placeholder(),
      );

      expect(oldWidget.updateShouldNotify(newWidget), isTrue);
    });
  });
}

import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Material Design Grid Theme', () {
    test('should notify on update', () {
      const theme = MaterialDesignGridTheme(
        data: MaterialDesignGridThemeData(columnSpacing: 1),
        child: Placeholder(),
      );

      const oldTheme = MaterialDesignGridTheme(
        data: MaterialDesignGridThemeData(columnSpacing: 2),
        child: Placeholder(),
      );

      expect(theme.updateShouldNotify(oldTheme), true);
    });
  });
}

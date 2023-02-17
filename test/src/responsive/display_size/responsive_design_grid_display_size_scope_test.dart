import 'package:design_grid/design_grid.dart';
import 'package:design_grid/src/responsive/display_size/responsive_design_grid_display_size_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Responsive Design Grid Display Size Scope', () {
    test('should notify on update', () {
      const oldWidget = ResponsiveDesignGridDisplaySizeScope(
        displaySize: ResponsiveDesignGridDisplaySize.large,
        child: Placeholder(),
      );

      const newWidget = ResponsiveDesignGridDisplaySizeScope(
        displaySize: ResponsiveDesignGridDisplaySize.medium,
        child: Placeholder(),
      );

      expect(oldWidget.updateShouldNotify(newWidget), isTrue);
    });
  });
}

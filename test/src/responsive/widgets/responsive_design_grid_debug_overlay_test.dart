import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Responsive Design Grid Debug Overlay', () {
    testWidgets('should hide overlay when button is pressed', (widgetTester) async {
      await widgetTester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ResponsiveDesignGridConfig(
              child: ResponsiveDesignGridDebugOverlay(
                isVisible: true,
                child: Container(
                  height: 100,
                ),
              ),
            ),
          ),
        ),
      );

      await widgetTester.pumpAndSettle();

      final overlay = find.byType(ResponsiveDesignGridDebugOverlay);
      final button = find.byType(FloatingActionButton);
      final gridItem = find.byType(ResponsiveDesignGridItem);

      expect(overlay, findsOneWidget);
      expect(gridItem, findsNWidgets(12));
      expect(button, findsOneWidget);

      await widgetTester.tap(button);

      await widgetTester.pumpAndSettle();

      expect(gridItem, findsNothing);
    });
  });
}

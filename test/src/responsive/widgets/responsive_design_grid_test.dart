import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Responsive Design Grid', () {
    testWidgets(
      'should throw when shouldCalculateLayout=false but no ResponsiveDesignGridItemData is found ',
      (widgetTester) async {
        await widgetTester.pumpWidget(
          const ResponsiveDesignGrid(
            shouldCalculateLayout: false,
            children: [],
          ),
        );

        final exception = await widgetTester.takeException();

        await widgetTester.pumpAndSettle();

        expect(exception, isA<Exception>());
      },
    );

    testWidgets('should build with column constructor', (widgetTester) async {
      await widgetTester.pumpWidget(
        const ResponsiveDesignGrid.column(
          children: [],
        ),
      );

      await widgetTester.pumpAndSettle();

      expect(find.byType(ResponsiveDesignGrid), findsOneWidget);
    });

    testWidgets('should build with listView constructor', (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: ResponsiveDesignGrid.listView(
            children: [],
          ),
        ),
      );

      await widgetTester.pumpAndSettle();

      expect(find.byType(ResponsiveDesignGrid), findsOneWidget);
    });
  });
}

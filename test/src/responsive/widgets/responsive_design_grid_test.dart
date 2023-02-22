import 'package:design_grid/design_grid.dart';
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
  });
}

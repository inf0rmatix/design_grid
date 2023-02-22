import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Design Grid Column Sizes', () {
    test('should notify on update', () {
      const oldWidget = DesignGridColumnSizes(
        sizes: [1, 2, 3],
        child: Placeholder(),
      );

      const newWidget = DesignGridColumnSizes(
        sizes: [1, 2, 3, 4],
        child: Placeholder(),
      );

      expect(oldWidget.updateShouldNotify(newWidget), isTrue);
    });

    testWidgets('should throw if of context finds no widget', (widgetTester) async {
      final key = GlobalKey();

      await widgetTester.pumpWidget(
        StatefulBuilder(
          key: key,
          builder: (context, setState) {
            return Container();
          },
        ),
      );

      await widgetTester.pumpAndSettle();

      expect(() => DesignGridColumnSizes.of(key.currentState!.context), throwsException);
    });
  });
}

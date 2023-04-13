import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Design Grid Default Row Alignment', () {
    test('should notify on update', () async {
      const oldWidget = DesignGridDefaultRowAlignment(
        alignment: DesignGridRowAlignment.center,
        child: Placeholder(),
      );

      const newWidget = DesignGridDefaultRowAlignment(
        alignment: DesignGridRowAlignment.end,
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

      expect(() => DesignGridDefaultRowAlignment.of(key.currentState!.context), throwsException);
    });

    testWidgets('should return alignment if of context finds widget', (widgetTester) async {
      const alignment = DesignGridRowAlignment.center;
      final key = GlobalKey();

      await widgetTester.pumpWidget(
        DesignGridDefaultRowAlignment(
          alignment: alignment,
          child: StatefulBuilder(
            key: key,
            builder: (context, setState) {
              return Container();
            },
          ),
        ),
      );

      await widgetTester.pumpAndSettle();

      expect(DesignGridDefaultRowAlignment.of(key.currentState!.context), alignment);
    });
  });
}

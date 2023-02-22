import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Responsive Design Grid Display Size Config', () {
    testWidgets('should use display size when specified', (widgetTester) async {
      late final ResponsiveDesignGridDisplaySize inheritedDisplaySize;

      await widgetTester.pumpWidget(
        ResponsiveDesignGridDisplaySizeConfig(
          displaySize: ResponsiveDesignGridDisplaySize.large,
          child: Builder(
            builder: (context) {
              inheritedDisplaySize = ResponsiveDesignGridDisplaySizeConfig.of(context);

              return const Placeholder();
            },
          ),
        ),
      );

      await widgetTester.pumpAndSettle();

      expect(inheritedDisplaySize, equals(ResponsiveDesignGridDisplaySize.large));
    });
  });
}

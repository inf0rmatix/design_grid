import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

class MaterialDesignGridTheme extends InheritedWidget {
  final MaterialDesignGridThemeData data;

  const MaterialDesignGridTheme({
    super.key,
    this.data = const MaterialDesignGridThemeData(),
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant MaterialDesignGridTheme oldWidget) {
    return data != oldWidget.data;
  }

  static MaterialDesignGridThemeData of(BuildContext context) {
    final theme = maybeOf(context);

    assert(theme != null, 'No MaterialDesignGridTheme found in context');

    return theme!;
  }

  static MaterialDesignGridThemeData? maybeOf(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<MaterialDesignGridTheme>();

    return theme?.data;
  }
}

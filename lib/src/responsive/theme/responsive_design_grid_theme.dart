import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

class ResponsiveDesignGridTheme extends InheritedWidget {
  final ResponsiveDesignGridThemeData data;

  const ResponsiveDesignGridTheme({
    super.key,
    required this.data,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant ResponsiveDesignGridTheme oldWidget) {
    return data != oldWidget.data;
  }

  static ResponsiveDesignGridThemeData of(BuildContext context) {
    final theme = maybeOf(context);

    assert(theme != null, 'No DesignGridTheme found in context');

    return theme!;
  }

  static ResponsiveDesignGridThemeData? maybeOf(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<ResponsiveDesignGridTheme>();

    return theme?.data;
  }
}

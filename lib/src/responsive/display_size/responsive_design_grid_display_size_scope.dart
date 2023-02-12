import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

class ResponsiveDesignGridDisplaySizeScope extends InheritedWidget {
  final ResponsiveDesignGridDisplaySize displaySize;

  const ResponsiveDesignGridDisplaySizeScope({
    super.key,
    required this.displaySize,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant ResponsiveDesignGridDisplaySizeScope oldWidget) {
    return oldWidget.displaySize != displaySize;
  }
}

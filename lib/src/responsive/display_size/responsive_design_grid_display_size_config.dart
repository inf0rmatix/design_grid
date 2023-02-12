import 'package:design_grid/design_grid.dart';
import 'package:design_grid/src/responsive/display_size/responsive_design_grid_display_size_scope.dart';
import 'package:flutter/widgets.dart';

class ResponsiveDesignGridDisplaySizeConfig extends StatelessWidget {
  /// Use this property to override the display size.
  final ResponsiveDesignGridDisplaySize? displaySize;

  /// If you want to override the default breakpoints, you can pass them in here.
  final ResponsiveDesignGridBreakpoints breakpoints;

  final Widget child;

  const ResponsiveDesignGridDisplaySizeConfig({
    super.key,
    this.displaySize,
    this.breakpoints = const ResponsiveDesignGridBreakpoints(),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    late final ResponsiveDesignGridDisplaySize displaySize;

    if (this.displaySize == null) {
      final size = MediaQuery.of(context).size;

      final width = size.width;

      displaySize = breakpoints.getDisplaySize(width);
    } else {
      displaySize = this.displaySize!;
    }

    return ResponsiveDesignGridDisplaySizeScope(
      displaySize: displaySize,
      child: child,
    );
  }

  static ResponsiveDesignGridDisplaySize of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<ResponsiveDesignGridDisplaySizeScope>();

    return scope!.displaySize;
  }
}

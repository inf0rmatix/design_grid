import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

/// A widget that configures the [ResponsiveDesignGrid] widget by wrapping the [child] in [ResponsiveDesignGridTheme] and [ResponsiveDesignGridDisplaySizeConfig].
class ResponsiveDesignGridConfig extends StatelessWidget {
  final ResponsiveDesignGridThemeData theme;

  /// Optional override for the [ResponsiveDesignGridDisplaySizeConfig] widget. Useful for testing.
  final ResponsiveDesignGridDisplaySize? displaySize;

  final Widget child;

  const ResponsiveDesignGridConfig({
    super.key,
    this.theme = const ResponsiveDesignGridThemeData(),
    this.displaySize,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveDesignGridDisplaySizeConfig(
      displaySize: displaySize,
      child: ResponsiveDesignGridTheme(
        data: theme,
        child: child,
      ),
    );
  }
}

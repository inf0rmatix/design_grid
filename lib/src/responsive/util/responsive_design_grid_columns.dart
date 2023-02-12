import 'package:design_grid/design_grid.dart';

/// Defines the number of columns a [ResponsiveDesignGridItem] should take up for each [ResponsiveDesignGridDisplaySize].
/// Values are inherited from small to extraLarge.
/// Small is always required and will be used for all other breakpoints that are not defined.
/// Example:
/// ```dart
/// ResponsiveDesignGridColumns(
///   small: 4,
///   large: 2,
/// )
/// ```
/// The number of columns will be 4 on small and since medium isn't set, it will be taken from small.
/// On large the number of columns will be 2 and on extra large too,
/// since the closest next-smaller breakpoint large is defined with 4 columns
class ResponsiveDesignGridColumns {
  final int small;
  final int? medium;
  final int? large;
  final int? extraLarge;

  const ResponsiveDesignGridColumns({
    required this.small,
    this.medium,
    this.large,
    this.extraLarge,
  });

  int getColumns(ResponsiveDesignGridDisplaySize displaySize) {
    switch (displaySize) {
      case ResponsiveDesignGridDisplaySize.small:
        return small;
      case ResponsiveDesignGridDisplaySize.medium:
        return medium ?? small;
      case ResponsiveDesignGridDisplaySize.large:
        return large ?? medium ?? small;
      case ResponsiveDesignGridDisplaySize.extraLarge:
        return extraLarge ?? large ?? medium ?? small;
    }
  }
}

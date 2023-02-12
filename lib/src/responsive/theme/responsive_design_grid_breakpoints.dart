import 'package:design_grid/design_grid.dart';

class ResponsiveDesignGridBreakpoints {
  final double small;
  final double medium;
  final double large;
  final double extraLarge;

  const ResponsiveDesignGridBreakpoints({
    this.small = 375,
    this.medium = 768,
    this.large = 1280,
    this.extraLarge = 1920,
  });

  ResponsiveDesignGridDisplaySize getDisplaySize(double width) {
    if (medium > width) {
      return ResponsiveDesignGridDisplaySize.small;
    }

    if (large > width) {
      return ResponsiveDesignGridDisplaySize.medium;
    }

    if (extraLarge > width) {
      return ResponsiveDesignGridDisplaySize.large;
    }

    return ResponsiveDesignGridDisplaySize.extraLarge;
  }
}

import 'package:design_grid/design_grid.dart';

class ResponsiveDesignGridThemeData {
  /// If you want to override the default breakpoints, you can pass them in here.
  final ResponsiveDesignGridBreakpoints? breakpoints;

  /// The number of columns in the grid.
  final int columns;

  /// The spacing between columns.
  final double columnSpacing;

  /// The spacing between rows.
  final double rowSpacing;

  /// The padding on the left and right of [DesignGrid] widgets. Nested [DesignGrid] widgets will not use this padding by default.
  final double gridPadding;

  const ResponsiveDesignGridThemeData({
    this.breakpoints = const ResponsiveDesignGridBreakpoints(),
    this.columns = 12,
    this.columnSpacing = 16.0,
    this.rowSpacing = 16.0,
    this.gridPadding = 16.0,
  })  : assert(columns > 0, 'The number of columns must be greater than zero'),
        assert(gridPadding % 1 == 0, 'The grid padding must not have a fractional part'),
        assert(columnSpacing % 1 == 0, 'The column spacing must not have a fractional part'),
        assert(rowSpacing % 1 == 0, 'The row spacing must not have a fractional part');

  @override
  bool operator ==(covariant ResponsiveDesignGridThemeData other) {
    if (identical(this, other)) return true;

    return other.columns == columns &&
        other.columnSpacing == columnSpacing &&
        other.rowSpacing == rowSpacing &&
        other.gridPadding == gridPadding;
  }

  @override
  int get hashCode {
    return columns.hashCode ^ columnSpacing.hashCode ^ rowSpacing.hashCode ^ gridPadding.hashCode;
  }
}

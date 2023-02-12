import 'package:design_grid/design_grid.dart';

class MaterialDesignGridThemeData {
  /// The breakpoints for the Material Design grid.
  final MaterialDesignGridBreakpoints breakpoints;

  /// The spacing between columns.
  final double columnSpacing;

  /// The spacing between rows.
  final double rowSpacing;

  const MaterialDesignGridThemeData({
    this.breakpoints = const MaterialDesignGridBreakpoints(),
    this.columnSpacing = 16.0,
    this.rowSpacing = 16.0,
  })  : assert(columnSpacing % 1 == 0, 'The column spacing must not have a fractional part'),
        assert(rowSpacing % 1 == 0, 'The row spacing must not have a fractional part');
}

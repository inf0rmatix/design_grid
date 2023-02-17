// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  @override
  bool operator ==(covariant MaterialDesignGridThemeData other) {
    if (identical(this, other)) return true;

    return other.breakpoints == breakpoints && other.columnSpacing == columnSpacing && other.rowSpacing == rowSpacing;
  }

  @override
  int get hashCode => breakpoints.hashCode ^ columnSpacing.hashCode ^ rowSpacing.hashCode;
}

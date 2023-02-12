import 'package:flutter/widgets.dart';

enum DesignGridRowAlignment {
  /// Place the objects as close to the start of the axis as possible.
  ///
  /// If this value is used in a horizontal direction, a [TextDirection] must be
  /// available to determine if the start is the left or the right.
  ///
  /// If this value is used in a vertical direction, a [VerticalDirection] must be
  /// available to determine if the start is the top or the bottom.
  start,

  /// Place the objects as close to the end of the axis as possible.
  ///
  /// If this value is used in a horizontal direction, a [TextDirection] must be
  /// available to determine if the end is the left or the right.
  ///
  /// If this value is used in a vertical direction, a [VerticalDirection] must be
  /// available to determine if the end is the top or the bottom.
  end,

  /// Place the objects as close to the middle of the axis as possible.
  center,

  /// Place the free space evenly between the objects.
  spaceBetween,

  /// Place the free space evenly between the objects as well as half of that
  /// space before and after the first and last objects.
  spaceAround,

  /// Place the free space evenly between the objects as well as before and
  /// after the first and last objects.
  spaceEvenly;

  /// Returns the [WrapAlignment] that corresponds to this [DesignGridRowAlignment].
  WrapAlignment toWrapAlignment() {
    switch (this) {
      case DesignGridRowAlignment.start:
        return WrapAlignment.start;
      case DesignGridRowAlignment.end:
        return WrapAlignment.end;
      case DesignGridRowAlignment.center:
        return WrapAlignment.center;
      case DesignGridRowAlignment.spaceBetween:
        return WrapAlignment.spaceBetween;
      case DesignGridRowAlignment.spaceAround:
        return WrapAlignment.spaceAround;
      case DesignGridRowAlignment.spaceEvenly:
        return WrapAlignment.spaceEvenly;
    }
  }

  /// Returns the [MainAxisAlignment] that corresponds to this [DesignGridRowAlignment].
  MainAxisAlignment toMainAxisAlignment() {
    switch (this) {
      case DesignGridRowAlignment.start:
        return MainAxisAlignment.start;
      case DesignGridRowAlignment.end:
        return MainAxisAlignment.end;
      case DesignGridRowAlignment.center:
        return MainAxisAlignment.center;
      case DesignGridRowAlignment.spaceBetween:
        return MainAxisAlignment.spaceBetween;
      case DesignGridRowAlignment.spaceAround:
        return MainAxisAlignment.spaceAround;
      case DesignGridRowAlignment.spaceEvenly:
        return MainAxisAlignment.spaceEvenly;
    }
  }
}

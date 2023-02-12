import 'package:flutter/widgets.dart';

class ResponsiveDesignGridItemData extends InheritedWidget {
  /// The number of columns the child should take up.
  final int columns;

  /// The calculated width of the child.
  final double width;

  const ResponsiveDesignGridItemData({
    super.key,
    required this.columns,
    required this.width,
    required super.child,
  }) : super();

  static ResponsiveDesignGridItemData of(BuildContext context) {
    final gridData = maybeOf(context);

    assert(
      gridData != null,
      'DesignGridChildData.of() called with a context that does not contain a DesignGridChildData.',
    );

    return gridData!;
  }

  static ResponsiveDesignGridItemData? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ResponsiveDesignGridItemData>();

  @override
  bool updateShouldNotify(covariant ResponsiveDesignGridItemData oldWidget) {
    return columns != oldWidget.columns || width != oldWidget.width;
  }
}

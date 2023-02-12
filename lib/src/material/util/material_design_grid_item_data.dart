import 'package:flutter/widgets.dart';

class MaterialDesignGridItemData extends InheritedWidget {
  /// The calculated width of the child.
  final double width;

  const MaterialDesignGridItemData({
    super.key,
    required this.width,
    required super.child,
  }) : super();

  static MaterialDesignGridItemData of(BuildContext context) {
    final gridData = maybeOf(context);

    assert(
      gridData != null,
      'DesignGridChildData.of() called with a context that does not contain a DesignGridChildData.',
    );

    return gridData!;
  }

  static MaterialDesignGridItemData? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MaterialDesignGridItemData>();

  @override
  bool updateShouldNotify(covariant MaterialDesignGridItemData oldWidget) {
    return width != oldWidget.width;
  }
}

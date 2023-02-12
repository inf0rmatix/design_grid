import 'package:flutter/widgets.dart';

class DesignGridColumnSizes extends InheritedWidget {
  final List<double> sizes;

  const DesignGridColumnSizes({
    super.key,
    required this.sizes,
    required super.child,
  });

  static List<double> of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<DesignGridColumnSizes>();

    if (widget == null) {
      throw Exception('No DesignGridColumnSizes found in the widget tree.');
    }

    return widget.sizes;
  }

  @override
  bool updateShouldNotify(covariant DesignGridColumnSizes oldWidget) {
    return oldWidget.sizes != sizes;
  }
}

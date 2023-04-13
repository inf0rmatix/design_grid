import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

class DesignGridDefaultRowAlignment extends InheritedWidget {
  final DesignGridRowAlignment alignment;

  const DesignGridDefaultRowAlignment({
    super.key,
    required this.alignment,
    required super.child,
  });

  static DesignGridRowAlignment of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<DesignGridDefaultRowAlignment>();

    if (widget == null) {
      throw Exception('No DesignGridDefaultRowAlignment found in the widget tree.');
    }

    return widget.alignment;
  }

  @override
  bool updateShouldNotify(covariant DesignGridDefaultRowAlignment oldWidget) {
    return oldWidget.alignment != alignment;
  }
}

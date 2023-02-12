import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';

/// Use this widget if you want a line break within a [ResponsiveDesignGridRow].
class DesignGridItemBreak extends DesignGridItemWidget {
  const DesignGridItemBreak({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }

  @override
  int getColumns(argument) {
    return 0;
  }
}

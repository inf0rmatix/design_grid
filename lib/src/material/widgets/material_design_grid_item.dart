import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

class MaterialDesignGridItem extends MaterialDesignGridItemWidget {
  final int columns;

  final Widget child;

  const MaterialDesignGridItem({
    super.key,
    required this.columns,
    required this.child,
  }) : assert(columns > 0 && columns <= 4, 'columns must be between 1 and 4');

  factory MaterialDesignGridItem.placeholder({
    Key? key,
    required int columns,
  }) {
    return MaterialDesignGridItem(
      key: key,
      columns: columns,
      child: const SizedBox(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final data = MaterialDesignGridItemData.of(context);

    return SizedBox(
      width: data.width,
      child: child,
    );
  }

  @override
  int getColumns(argument) {
    return columns;
  }
}

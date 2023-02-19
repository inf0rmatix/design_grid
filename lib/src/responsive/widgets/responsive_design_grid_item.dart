// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

/// A widget that represents a child of a [ResponsiveDesignGrid] widget.
class ResponsiveDesignGridItem extends ResponsiveDesignGridItemWidget {
  final Widget child;

  const ResponsiveDesignGridItem({
    super.key,
    required super.columns,
    required this.child,
  });

  factory ResponsiveDesignGridItem.placeholder({
    Key? key,
    required ResponsiveDesignGridColumns columns,
  }) {
    return ResponsiveDesignGridItem(
      key: key,
      columns: columns,
      child: const SizedBox(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final childData = ResponsiveDesignGridItemData.of(context);

    return SizedBox(
      width: childData.width,
      child: child,
    );
  }

  @override
  int getColumns(argument) {
    ResponsiveDesignGridDisplaySize displaySize = argument;

    return columns.getColumns(displaySize);
  }
}

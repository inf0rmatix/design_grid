import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

class ResponsiveDesignGridRow extends DesignGridRow<ResponsiveDesignGridItemWidget> {
  const ResponsiveDesignGridRow({
    super.key,
    super.alignment = DesignGridRowAlignment.start,
    required super.children,
  });

  @override
  double getRowSpacing(BuildContext context) {
    return ResponsiveDesignGridTheme.of(context).rowSpacing;
  }

  @override
  double getColumnSpacing(BuildContext context) {
    return ResponsiveDesignGridTheme.of(context).columnSpacing;
  }

  @override
  int getItemColumns(BuildContext context, ResponsiveDesignGridItemWidget item) {
    return item.getColumns(ResponsiveDesignGridDisplaySizeConfig.of(context));
  }

  @override
  Widget buildChild(int columns, double width, ResponsiveDesignGridItemWidget child) {
    return ResponsiveDesignGridItemData(
      columns: columns,
      width: width,
      child: child,
    );
  }
}

import 'package:design_grid/design_grid.dart';

abstract class ResponsiveDesignGridItemWidget extends DesignGridItemWidget {
  /// Specify the number of columns this child should occupy for each breakpoint.
  final ResponsiveDesignGridColumns columns;

  const ResponsiveDesignGridItemWidget({
    super.key,
    required this.columns,
  });
}

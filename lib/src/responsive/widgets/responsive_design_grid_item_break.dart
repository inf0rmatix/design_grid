import 'package:design_grid/design_grid.dart';

/// Use this widget if you want a line break within a [ResponsiveDesignGridRow].
class ResponsiveDesignGridItemBreak extends DesignGridItemBreak implements ResponsiveDesignGridItemWidget {
  @override
  ResponsiveDesignGridColumns get columns => const ResponsiveDesignGridColumns(small: 0);

  const ResponsiveDesignGridItemBreak({super.key});
}

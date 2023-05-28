import 'package:flutter/widgets.dart';

/// A widget that represents a child of a [DesignGrid] widget.
/// This is an abstract class, used by the implementations [ResponsiveDesignGridItemWidget] and [MaterialDesignGridItemWidget].
abstract class DesignGridItemWidget extends StatelessWidget {
  const DesignGridItemWidget({
    super.key,
  });

  int getColumns(dynamic argument);
}

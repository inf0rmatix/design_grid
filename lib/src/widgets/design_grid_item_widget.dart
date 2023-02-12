import 'package:flutter/widgets.dart';

/// A widget that represents a child of a [DesignGrid] widget. This is an abstract class, so you should use either [DesignGridChild] or [DesignGridChildBuilder].
/// For custom widgets, you can extend this class.
abstract class DesignGridItemWidget extends StatelessWidget {
  const DesignGridItemWidget({
    super.key,
  });

  int getColumns(dynamic argument);
}

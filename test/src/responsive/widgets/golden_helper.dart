import 'package:alchemist/alchemist.dart';
import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

const breakpoints = ResponsiveDesignGridBreakpoints();

final breakpointScenarios = <ResponsiveDesignGridDisplaySize, double>{
  ResponsiveDesignGridDisplaySize.small: breakpoints.small,
  ResponsiveDesignGridDisplaySize.medium: breakpoints.medium,
  ResponsiveDesignGridDisplaySize.large: breakpoints.large,
  ResponsiveDesignGridDisplaySize.extraLarge: breakpoints.extraLarge,
};

List<GoldenTestScenario> responsiveBreakpointScenarios({required Widget child}) {
  return [
    for (final entry in breakpointScenarios.entries)
      GoldenTestScenario(
        name: entry.key.toString(),
        constraints: BoxConstraints(
          maxWidth: entry.value,
        ),
        child: MediaQuery(
          data: MediaQueryData(
            size: Size(
              entry.value,
              double.maxFinite,
            ),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: entry.value),
            child: child,
          ),
        ),
      ),
  ];
}

import 'package:design_grid/design_grid.dart';
import 'package:flutter/widgets.dart';

// TODO add listview.builder design grid variant

/// To implement a design system with a column-grid, you can use this widget.
///
/// To get started, you need to wrap your home widget or router with the [ResponsiveDesignGridConfig] widget.
///
/// This widget will use the [ResponsiveDesignGridDisplaySizeConfig] to provide the current [ResponsiveDesignGridDisplaySize] to all children.
///
/// To adjust the number of columns, column-spacing and the grid's outer padding, use [ResponsiveDesignGridConfig.theme].
///
/// The [ResponsiveDesignGrid] widget will calculate the layout based on the current [ResponsiveDesignGridDisplaySize] and the [ResponsiveDesignGridTheme].
///
/// Nesting grids is possible by using the [ResponsiveDesignGrid] widget inside a [ResponsiveDesignGridItem].
///
/// The [ResponsiveDesignGrid] widget will automatically calculate the layout, if it is the top most grid.
/// If you use the [ResponsiveDesignGrid] inside a child but the [ResponsiveDesignGrid] itself doesn't get the full width, i.e. inside a card or a setup with other widgets, you can set [ResponsiveDesignGrid.shouldCalculateLayout] to true.
/// Use this flag as little as possible, as it uses [LayoutBuilder] which is heavy on performance.
///
/// Example:
/// ```dart
/// class ExampleApp extends StatelessWidget {
///   const ExampleApp({super.key});
///
///   @override
///   Widget build(BuildContext context) {
///     return MaterialApp(
///       title: 'Grid Demo',
///       theme: ThemeData(
///         useMaterial3: true,
///         colorScheme: ColorScheme.fromSeed(
///           seedColor: Colors.teal,
///           brightness: Brightness.dark,
///         ),
///       ),
///       // The DesignGridConfig should be the top most widget.
///       home: ResponsiveDesignGridConfig(
///         child: Scaffold(
///           body: ResponsiveDesignGrid(
///             // You can specify the alignment of the grid, default is start.
///             alignment: DesignGridAlignment.center,
///             children: [
///               // This will wrap its children if necessary.
///               // If you want to enforce a break, use another DesignGridRow.
///               // For special use-cases you can also use DesignGridItemBreak to force a break.
///               ResponsiveDesignGridRow(
///                 // You can specify the alignment of the row, default is start.
///                 alignment: DesignGridRowAlignment.center,
///                 children: [
///                   ResponsiveDesignGridItem(
///                     // Specify the number of columns for each display size.
///                     // Small is always required, all others will be inherited in order with the breakpoints:
///                     // small, medium, large, extraLarge
///                     columns: const ResponsiveDesignGridColumns(small: 12),
///                     // The child will be constrained in width according to the number of columns.
///                     child: Container(
///                       padding: const EdgeInsets.all(16),
///                       color: Colors.grey,
///                       child: const Text('I span 12 columns'),
///                     ),
///                   ),
///                   ResponsiveDesignGridItem(
///                     columns: const ResponsiveDesignGridColumns(small: 6),
///                     child: Container(
///                       padding: const EdgeInsets.all(16),
///                       color: Colors.grey,
///                       child: const Text('I span 6 columns'),
///                     ),
///                   ),
///                 ],
///               ),
///               ResponsiveDesignGridRow(
///                 children: [
///                   ResponsiveDesignGridItem(
///                     columns: const ResponsiveDesignGridColumns(
///                       small: 8,
///                       large: 4,
///                     ),
///                     child: Container(
///                       padding: const EdgeInsets.all(16),
///                       color: Colors.grey,
///                       child: const Text(
///                           'I span 8 columns on small screens, on medium too, and 4 on large screens and extra large screens.'),
///                     ),
///                   ),
///                 ],
///               ),
///             ],
///           ),
///         ),
///       ),
///     );
///   }
/// }
/// ```
class ResponsiveDesignGrid extends StatelessWidget {
  final DesignGridAlignment alignment;

  /// Whether to use the outer padding of the grid or not. Top level grid will be true by default, nested grids will be false by default.
  final bool? useOuterPadding;

  /// By default only the top most grid will calculate the layout. If this grid is nested and should calculate the layout, set this to true.
  /// This is useful, if you use the [ResponsiveDesignGrid] inside a child but the [ResponsiveDesignGrid] itself doesn't get the full width, i.e. inside a card or a setup with other widgets.
  final bool? shouldCalculateLayout;

  final List<ResponsiveDesignGridRow> children;

  const ResponsiveDesignGrid({
    super.key,
    this.alignment = DesignGridAlignment.start,
    this.useOuterPadding,
    this.shouldCalculateLayout,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final parentGridItemData = ResponsiveDesignGridItemData.maybeOf(context);

    final isNested = parentGridItemData != null;

    final shouldCalculateLayout = this.shouldCalculateLayout ?? !isNested;

    final useOuterPadding = this.useOuterPadding ?? !isNested;

    if (shouldCalculateLayout) {
      // Avoid using LayoutBuilder if possible, because it will rebuild the whole grid on every change and is bad for performance.
      return LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.biggest.width;

          return _DesignGridBuilder(
            alignment: alignment,
            useOuterPadding: useOuterPadding,
            width: width,
            children: children,
          );
        },
      );
    } else {
      if (parentGridItemData == null) {
        throw Exception('Should calculate layout is set to false, but this widget is not a child of a DesignGrid.');
      }

      final width = parentGridItemData.width;

      return _DesignGridBuilder(
        alignment: alignment,
        useOuterPadding: useOuterPadding,
        width: width,
        children: children,
      );
    }
  }
}

class _DesignGridBuilder extends StatelessWidget {
  final DesignGridAlignment alignment;

  final bool useOuterPadding;

  final double width;

  final List<ResponsiveDesignGridRow> children;

  const _DesignGridBuilder({
    required this.alignment,
    required this.useOuterPadding,
    required this.width,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ResponsiveDesignGridTheme.maybeOf(context) ?? const ResponsiveDesignGridThemeData();

    final availableWidth = useOuterPadding ? width - theme.gridPadding * 2 : width;

    final columnSizes = DesignGridCalculator.calculateColumnSizes(availableWidth, theme.columns, theme.columnSpacing);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: useOuterPadding ? theme.gridPadding : 0),
      child: DesignGridColumnSizes(
        sizes: columnSizes,
        child: SizedBox(
          width: availableWidth,
          child: Column(
            crossAxisAlignment: alignment.toCrossAxisAlignment(),
            children: children
                .expand((child) => [
                      child,
                      if (children.last != child)
                        SizedBox(
                          height: theme.rowSpacing,
                        ),
                    ])
                .toList(),
          ),
        ),
      ),
    );
  }
}

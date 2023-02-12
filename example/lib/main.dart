import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Brightness brightness = Brightness.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Design Grid Example',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: brightness,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.grid_on_rounded),
          actions: [
            IconButton(
              onPressed: () => setState(() {
                brightness = brightness == Brightness.dark ? Brightness.light : Brightness.dark;
              }),
              icon: brightness == Brightness.dark
                  ? const Icon(Icons.light_mode_rounded)
                  : const Icon(Icons.dark_mode_rounded),
            ),
          ],
          title: const Text('Design Grid Example'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          children: const [
            ResponsiveDesignGridExample(),
            Divider(
              height: 64.0,
            ),
            MaterialDesignGridExample(),
          ],
        ),
      ),
    );
  }
}

class ResponsiveDesignGridExample extends StatelessWidget {
  const ResponsiveDesignGridExample({super.key});

  @override
  Widget build(BuildContext context) {
    // The ResponsiveDesignGridConfig widget is used to configure the ResponsiveDesignGrid.
    // This widget should be placed as high up in the widget tree as possible.
    // You can also pass a custom theme to change row spacing, column spacing, the grid outer padding and even the number of columns for the grid.
    return ResponsiveDesignGridConfig(
      // The ResponsiveDesignGridDebugOverlay is a useful widget to visually debug your grid implementation.
      child: ResponsiveDesignGridDebugOverlay(
        child: ResponsiveDesignGrid(
          children: [
            // This is a responsive design grid row. Contrary to Flutter's Row widget, this is more a logical separation and will wrap its children if necessary.
            // Keep your rows as small as possible. To enforce a visual line break, prefer using a new Responsive Design Grid Row.
            // For some rare occasions, there is the ResponsiveDesignGridBreak widget which enforces a visual line break within a row.
            ResponsiveDesignGridRow(
              children: [
                // This is a responsive design grid item, which spans 12 columns on small screens, 10 columns on medium screens, 8 columns on large screens, and 6 columns on extra large screens.
                ResponsiveDesignGridItem(
                  columns: const ResponsiveDesignGridColumns(
                    small: 12,
                    medium: 8,
                    large: 6,
                    extraLarge: 4,
                  ),
                  // The child widget will be wrapped in a SizedBox widget with constrained width according to the columns property.
                  child: Card(
                    child: Column(
                      children: const [
                        ListTile(
                          title: Text('Responsive Design Grid'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                              'This example shows how to use the ResponsiveDesignGrid. This element spans 12 columns on small screens, 10 columns on medium screens, 8 columns on large screens, and 6 columns on extra large screens.'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            ResponsiveDesignGridRow(
              children: [
                ResponsiveDesignGridItem(
                  columns: const ResponsiveDesignGridColumns(
                    small: 6,
                    medium: 4,
                    large: 3,
                    extraLarge: 2,
                  ),
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                ResponsiveDesignGridItem(
                  columns: const ResponsiveDesignGridColumns(
                    small: 6,
                    medium: 4,
                    large: 3,
                    extraLarge: 2,
                  ),
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                ResponsiveDesignGridItem(
                  columns: const ResponsiveDesignGridColumns(
                    small: 6,
                    medium: 4,
                    large: 3,
                    extraLarge: 2,
                  ),
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                ResponsiveDesignGridItem(
                  columns: const ResponsiveDesignGridColumns(
                    small: 6,
                    medium: 4,
                    large: 3,
                    extraLarge: 2,
                  ),
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MaterialDesignGridExample extends StatelessWidget {
  const MaterialDesignGridExample({super.key});

  @override
  Widget build(BuildContext context) {
    // The MaterialDesignGridTheme widget is used to configure the MaterialDesignGrid.
    // Place this widget as high up in the widget tree as possible.
    // You can also pass a custom theme to change spacings and even custom breakpoints.
    // The breakpoints control how many columns there are, the outer padding and the (optional) maximum body width.
    return MaterialDesignGridTheme(
      // The MaterialDesignGridDebugOverlay is a useful widget to visually debug your grid implementation.
      child: MaterialDesignGridDebugOverlay(
        child: MaterialDesignGrid(
          children: [
            // This is a Material Design Grid Row, contrary to Flutter's Row widget, this one wraps children when necessary.
            // Keep your rows as small as possible. To enforce a visual line break, prefer using a new Material Design Grid Row.
            // For some rare occasions, there is the MaterialDesignGridBreak widget which enforces a visual line break within a row.
            MaterialDesignGridRow(
              children: [
                // Material Design Grid Items are given a fixed column span, which must not be greater then the smallest amount of columns defined in the breakpoints. (By default, this is 4 columns)
                MaterialDesignGridItem(
                  columns: 4,
                  child: Card(
                    child: Column(
                      children: const [
                        ListTile(
                          title: Text('Material Design Grid'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                              'This is a Material Design Grid example. The Material Design Grid uses a varying number of columns depending on the screen size. Its children are given a fixed number of columns.'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            MaterialDesignGridRow(
              children: [
                MaterialDesignGridItem(
                  columns: 2,
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                MaterialDesignGridItem(
                  columns: 2,
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                MaterialDesignGridItem(
                  columns: 2,
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                MaterialDesignGridItem(
                  columns: 2,
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                MaterialDesignGridItem(
                  columns: 2,
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                MaterialDesignGridItem(
                  columns: 2,
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

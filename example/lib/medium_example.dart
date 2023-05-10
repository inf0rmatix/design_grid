import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Design Grid Example',
      builder: (context, child) {
        return ResponsiveDesignGridConfig(
          breakpoints: const ResponsiveDesignGridBreakpoints(
            small: 375,
            medium: 768,
            large: 1280,
            extraLarge: 1920,
          ),
          theme: const ResponsiveDesignGridThemeData(
            columns: 12,
            columnSpacing: 16.0,
            rowSpacing: 16.0,
            gridPadding: 16.0,
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.grid_on_rounded),
          title: const Text('Responsive Design Grid'),
        ),
        body: ResponsiveDesignGrid(
          children: [
            ResponsiveDesignGridRow(
              alignment: DesignGridRowAlignment.center,
              children: [
                ResponsiveDesignGridItem(
                  columns: const ResponsiveDesignGridColumns(
                    small: 12,
                    medium: 10,
                    large: 8,
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name*',
                      border: OutlineInputBorder(),
                    ),
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

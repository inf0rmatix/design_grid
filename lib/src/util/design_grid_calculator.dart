class DesignGridCalculator {
  static List<double> calculateColumnSizes(double width, int columns, double columnSpacing) {
    final spacers = columns - 1;

    final totalSpacingWidth = spacers * columnSpacing;

    final columnSpace = width - totalSpacingWidth;

    var columnRest = columnSpace % columns;

    final evenlyDividableColumnSpace = columnSpace - columnRest;

    final columnWidth = evenlyDividableColumnSpace / columns;

    final columnSizes = List.generate(columns, (_) => columnWidth);

    for (var column = 0; column < columns; column++) {
      if (columnRest >= 1) {
        columnSizes[column] += 1;
        columnRest--;
      } else {
        columnSizes[column] += columnRest;
        columnRest = 0;
        break;
      }
    }

    return columnSizes;
  }

  static double calculateChildSize({
    required List<double> columnSizes,
    required int columnCounter,
    required int childColumns,
    required double columnSpacing,
  }) {
    final columnSize =
        columnSizes.sublist(columnCounter, childColumns + columnCounter).reduce((value, element) => value + element);

    final spannedSpacers = childColumns - 1;

    final spannedSpacersSize = spannedSpacers * columnSpacing;

    final childSize = columnSize + spannedSpacersSize;

    return childSize;
  }
}

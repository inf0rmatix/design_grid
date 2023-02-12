import 'package:design_grid/design_grid.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MaterialDesignGridBreakpoints', () {
    const breakpoints = MaterialDesignGridBreakpoints();

    test('should return correct columns', () {
      expect(breakpoints.getColumns(0), 4);
      expect(breakpoints.getColumns(599), 4);
      expect(breakpoints.getColumns(600), 8);
      expect(breakpoints.getColumns(904), 8);
      expect(breakpoints.getColumns(905), 12);
      expect(breakpoints.getColumns(1239), 12);
      expect(breakpoints.getColumns(1240), 12);
      expect(breakpoints.getColumns(1439), 12);
      expect(breakpoints.getColumns(1440), 12);
    });

    test('should return correct margin', () {
      expect(breakpoints.getMargin(0), 16);
      expect(breakpoints.getMargin(599), 16);
      expect(breakpoints.getMargin(600), 32);
      expect(breakpoints.getMargin(904), 32);
      expect(breakpoints.getMargin(905), null);
      expect(breakpoints.getMargin(1239), null);
      expect(breakpoints.getMargin(1240), 200);
      expect(breakpoints.getMargin(1439), 200);
      expect(breakpoints.getMargin(1440), null);
    });

    test('should return correct body width', () {
      expect(breakpoints.getBodyWidth(0), null);
      expect(breakpoints.getBodyWidth(599), null);
      expect(breakpoints.getBodyWidth(600), null);
      expect(breakpoints.getBodyWidth(904), null);
      expect(breakpoints.getBodyWidth(905), 840);
      expect(breakpoints.getBodyWidth(1239), 840);
      expect(breakpoints.getBodyWidth(1240), null);
      expect(breakpoints.getBodyWidth(1439), null);
      expect(breakpoints.getBodyWidth(1440), 1040);
    });
  });
}

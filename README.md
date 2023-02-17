<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
<a href="https://github.com/inf0rmatix]/design_grid/actions"><img src="https://github.com/inf0rmatix/design_grid/workflows/tests/badge.svg" alt="Build Status"></a> 
<a href="https://codecov.io/gh/inf0rmatix/design_grid" > 
 <img src="https://codecov.io/gh/inf0rmatix/design_grid/branch/master/graph/badge.svg?token=7OWGIYJD5Y"/> 
</a>

TODO finalize Readme

The classic use-case of implementing a colum-based design. Use the classic ResponsiveDesignGrid to implement a bootstrap-like design system where every element has a different column-span based on breakpoints.

Need to implement a design based on the strict rules of Material Layout? Use the MaterialDesignGrid to get an exact implementation of the [Material Design Layout guide](https://m2.material.io/design/layout/responsive-layout-grid.html)

## 🔗 Table of Contents
- [🔗 Table of Contents](#-table-of-contents)
- [✨ Features](#-features)
  - [Responsive Design Grid](#responsive-design-grid)
  - [Material Design Grid](#material-design-grid)
- [🎉 Getting started](#-getting-started)
- [🏗️ Usage](#️-usage)
  - [Responsive Design Grid](#responsive-design-grid-1)
  - [Material Design Grid](#material-design-grid-1)
- [📚 Additional information](#-additional-information)
  - [Implementing a custom design grid approach](#implementing-a-custom-design-grid-approach)


## ✨ Features

### Responsive Design Grid

Implement a column-based design with different column-spans for every breakpoint.
Responsive design grid widgets can be indefinitely nested.
Create small and clean widgets that use ResponsiveDesignGrid for layout.
They will fit, no matter how deeply nested you use them.

You can customize:

- Breakpoints
- Column-spacing
- Row-spacing
- Grid-padding
- Amount of columns

![](readme/responsive_design_grid.gif)

### Material Design Grid

Implement a design based on the Material Design guidelines.
Material Design Grid is not meant to be used nested.

You can customize:

- Breakpoints
- Column-spacing
- Row-spacing
- Grid-padding
- Amount of columns per breakpoint

![](readme/material_design_grid.gif)

## 🎉 Getting started

Decide whether you need to use the `ResponsiveDesignGrid` or the `MaterialDesignGrid`.
Talk with your designer to build a common understanding.

## 🏗️ Usage

### Responsive Design Grid

```dart
@override
Widget build(BuildContext context){
    return ResponsiveDesignGridConfig(
        child: ResponsiveDesignGrid(
            children: [
                ResponsiveDesignGridRow(
                    children: [
                        ResponsiveDesignGridItem(
                            columns: ResponsiveDesignGridColumns(
                                small: 12,
                                medium: 10,
                                large: 8,
                                extraLarge: 6,
                            ),
                            child: Placeholder(),
                        ),
                    ],
                )
            ],
        ),
    );
}
```

### Material Design Grid

```dart
@override
Widget build(BuildContext context) {
    return MaterialDesignGridTheme(
        child: MaterialDesignGrid(
            children: [
                MaterialDesignGridRow(
                    children: [
                        MaterialDesignGridItem(
                            columns: 4,
                            child: Placeholder(),
                        ),
                    ],
                )
            ],
        ),
    );
}
```

## 📚 Additional information

### Implementing a custom design grid approach

The base widgets used for both the `ResponsiveDesignGrid` as well as the `MaterialDesignGrid` can be found in `lib/src/widgets`.
You can extend those to create your super-fancy very own custom design grid implementation 🥳.

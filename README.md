# Reed Case Polygon

[[以中文阅读](README_CN.md) | [Read in English](README.md)]

Parametric OpenSCAD model of the OpenReed rolling polygon case for oboe reeds. The design is rebuilt from the seven-panel `OboeReedHexCase/v4-7` SOLIDWORKS model. The source of truth for the dimensions is `reed-case-polygon.scad`.

## Parts

The default model is a flat, print-in-place strip of seven panels. It has one left end, one right end, one centre panel, and four identical middle panels. The panels have alternating hinge knuckles and an integrated pin. Each panel carries one reed by its staple and the centre clamp. The centre panel contains a long magnet pocket; the end panels have small closure magnet pockets and finger recesses.

Open `reed-case-polygon.scad` in OpenSCAD and use the Customizer:

- `Part = "assembly"`, `AssemblyView = "flat"`: printing layout.
- `Part = "assembly"`, `AssemblyView = "closed"`: rolled-up shape preview.
- `Part = "left"`, `"middle"`, `"center"`, or `"right"`: individual STL exports.

The default capacity is seven reeds. `EdgesNumber` can be any odd number from five upward; the panel spacing, polygon profile, top transition and total height derive from it. `Radius = 19` and `EdgesNumber = 7` reproduce the original nominal dimensions: approximately 16.49 mm between hinge axes and 96.72 mm tall.

## Printing and assembly

Render with **F6** before exporting STL. The model uses millimetres. Print the flat assembly upright, with the panel floors on the build plate. Use a small test print of two neighbouring hinge sections to tune `HingeTolerance` and `PanelClearance` for the printer. The closed view is for checking the shape; export the flat view for a print-in-place case.

The magnet pockets are enclosed so magnets can be inserted during a print pause. According to the v4-7 equations and STEP cavities, the small pockets accept nominal 10 × 5 × 1 mm magnets. The centre pocket accepts a nominal 40 × 10 × 2 mm magnet. Check the magnet orientation before sealing the pockets.

## Source and license

The rebuild follows the dimensions in `OboeReedHexCase/v4-7/equations.txt` and the STEP assembly. The source STEP and SOLIDWORKS files are kept outside this repository as design references. The OpenSCAD source is released under the [MIT license](LICENSE), matching the OpenReed `cane-splitter` repository.

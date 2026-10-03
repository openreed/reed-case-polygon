# Reed Case Polygon

[Read in English](README.md) | [以中文阅读](README_CN.md)

Parametric 3D model of the OpenReed rolling polygon case for oboe reeds. The model is built using [OpenSCAD](https://openscad.org/) and intended for FDM 3D printing. See [reed-case-polygon.scad](reed-case-polygon.scad).

The case unfolds into a row of reed holders and rolls closed into a polygon. Each panel holds one reed with a staple seat and a flexible clamp. Integrated print-in-place hinges connect the panels, and embedded magnets hold the two ends closed. The centre panel also contains a long magnet pocket.

The default case holds **seven reeds**, with a nominal closed polygon radius of **19 mm**, an internal reed height of **75 mm**, and an overall height of approximately **96.72 mm**.

## Generating 3D model files

1. Open [reed-case-polygon.scad](reed-case-polygon.scad) in OpenSCAD. No external OpenSCAD libraries are required.
2. Use the Customizer to adjust the dimensions. For the complete print-in-place case, select `Part = "assembly"` and `AssemblyView = "flat"`.
3. Render with **F6**, then export the model as STL. All dimensions are in millimetres.

`AssemblyView = "closed"` previews the rolled-up shape. Use the **flat** view for printing. `Part = "left"`, `"middle"`, `"center"`, or `"right"` exports an individual panel for inspection or test prints; the complete flat assembly includes the interlocking hinges in their printing positions.

Pre-generated files are available in [3D_files](3D_files):

- [STL model](3D_files/reed-case-polygon.stl)
- [3MF print project](3D_files/reed-case-polygon.3mf)

Review the printer profile, orientation, and magnet pause layers before using the 3MF project. Regenerate the STL after changing any model parameters.

## Main parameters

All parameters are defined in [reed-case-polygon.scad](reed-case-polygon.scad).

- `EdgesNumber`: panel count and reed capacity. Default: `7`; use an odd integer of at least `5`.
- `Radius`: circumradius of the closed polygon. Default: `19 mm`.
- `InnerHeight`: internal height for the reed. Default: `75 mm`.
- `PanelClearance`: gap between adjacent flat panels. Default: `0.4 mm`.
- `HingeTolerance`: hinge fit clearance. Default: `0.5 mm`.
- `ClampRadius` and `ClampThickness`: reed clamp fit and flexibility. Defaults: `2.3 mm` and `1 mm`.
- `BackMagnet*`, `BottomMagnet*`, and `UpperMagnet*`: magnet dimensions, pocket depths, and clearances.

Changing the panel count or radius also changes panel spacing, the upper transition, and overall height. Adjust the fit parameters for your printer instead of scaling the entire STL, which would also resize the magnet pockets and reed holders.

## 3D printing guide

**The magnet pockets are enclosed. Insert the magnets during printing, before the pocket roofs are printed. They cannot be inserted after the case is complete.**

### Prepare the magnets

For the default model, prepare:

- **4 rectangular magnets, 10 × 5 × 1 mm**: two in the left end panel and two in the right end panel, with one upper and one lower magnet per panel.
- **1 rectangular magnet, 40 × 10 × 2 mm**: in the centre panel.

The **10 mm** dimension of each small magnet and the **40 mm** dimension of the long magnet run vertically along the case. The **1 mm** and **2 mm** dimensions are their thicknesses. Measure the actual magnets and adjust the corresponding pocket parameters if needed.

Before printing, arrange the two pairs of closure magnets as they will face each other when the case is closed. Check that the lower pair attracts and the upper pair attracts, then mark each magnet's position and orientation. Use magnets magnetized through their thickness for these facing closure pairs.

### Orientation and slicing

1. Place the **flat assembly upright**, with the panel floors on the build plate and the hinge axes vertical. Keep every panel at the same Z height.
2. The supplied 3MF uses a **0.4 mm nozzle**, **0.2 mm layer height**, and **supports disabled**. Treat these as starting settings and inspect the sliced hinge gaps, thin clamps, and bridges over the pockets.
3. Keep supports out of the enclosed magnet pockets and hinge clearances. If adding a brim, check that it can be removed without leaving the neighbouring panels joined.
4. Before a full print, test a short section containing two neighbouring hinges and a magnet pocket. Check that the hinge moves and that the actual magnet fits; adjust `HingeTolerance`, `PanelClearance`, or the magnet tolerances as needed.
5. Add and verify the **three magnet insertion pauses** described below. Use the slicer's pause command supported by your printer, with the nozzle parked away from the part. Recheck the pauses whenever you reslice or change the model.

### Pause layers and magnet insertion

For the default parameters, with the bottom of the model at **Z = 0**, the pocket height ranges are:

1. **Lower closure magnets, two pieces:** pockets from **Z = 4.90 to 15.10 mm**. Pause before the first layer that closes these pockets, near the **15.10 mm** roof height, and insert one small magnet in each end panel.
2. **Centre magnet, one piece:** pocket from **Z ≈ 28.16 to 68.56 mm**. Pause before its first closing layer, near the **68.56 mm** roof height, and insert the long magnet in the centre panel.
3. **Upper closure magnets, two pieces:** pockets from **Z ≈ 81.62 to 91.82 mm**. Pause before their first closing layer, near the **91.82 mm** roof height, and insert the remaining small magnet in each end panel.

**These are geometric roof heights, not fixed pause heights or layer numbers.** In the sliced preview, find the first toolpath that spans each pocket opening and arrange the pause immediately before that toolpath prints. Confirm whether your slicer pauses before or after the selected layer. First-layer height, variable layer height, model placement, and parameter changes can all alter the pause layers.

At each pause:

1. Keep the build plate and model in place. Check that the nozzle is parked clear of the insertion area.
2. Insert the specified magnets from the open top of their pockets, following the polarity marks. Seat them fully on the printed pocket floor.
3. Check that every magnet sits at or below the surrounding printed surface and clear of the next nozzle path. **Do not insert magnets when the pockets first appear:** the upright magnets would protrude into the nozzle's path.
4. Keep loose magnets away from the print head, remove any debris from the opening, and resume printing to seal the pockets.

The default extra pocket height is only **0.2 mm** for the small magnets and **0.4 mm** for the long magnet. Check the sliced floor height as well as the roof: if a seated magnet would still protrude at the last open layer, adjust the local layer heights or increase `BottomMagnetHeightTolerance`, `UpperMagnetHeightTolerance`, or `BackMagnetHeightTolerance`, then regenerate and reslice before printing.

### After printing

Allow the case to cool, remove any brim, and gently work each hinge until the panels move freely. Roll the case closed and check that both magnet pairs attract. Test the staple seat and clamp with one reed before loading the remaining holders.

## License

[MIT License](LICENSE) — © 2026 OpenReed.

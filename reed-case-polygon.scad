// OpenReed polygon reed case
// Rebuilt from OboeReedHexCase/v4-7. All dimensions are in millimetres.

$fn = 64;

/*[输出 | Output]*/
// 输出整盒或单个零件 | Whole case or a single part
Part = "assembly"; // [assembly, left, middle, center, right]
// 整盒展开用于打印，卷合用于检查外形 | Flat for printing, closed for inspection
AssemblyView = "flat"; // [flat, closed]

/*[基本参数 | Basic Parameters]*/
// 扇片数量（必须为奇数）/ 哨片容量 | Number of panels / reed capacity (odd)
EdgesNumber = 7;
// 卷合后多边形的外接圆半径 | Circumradius of the closed case
Radius = 19;
// 哨片所在的内部高度 | Clear height for the reed
InnerHeight = 75;

/*[盒体参数 | Case Parameters]*/
// 底面厚度 | Floor thickness
FloorThickness = 4;
// 顶面厚度 | Ceiling thickness
CeilingThickness = 2;
// 内侧壁厚度 | Thickness of the inner wall
WallThickness = 1.4;
// 哨座槽高度 | Staple slot height
StapleSlotHeight = 16;
// 哨座定位柱高度 | Staple mandrel height
StapleMandrelHeight = 2.5;
// 上端收口角度 | Angle of the upper transition
BlendingAngle = 45;
// 扇片中央的避让间隙 | Relief at the centre of the closed polygon
CenterClearance = 0.783;
// 相邻扇片的打印间隙 | Clearance between flat panels
PanelClearance = 0.4;
// 普通边缘圆角 | Small edge fillet
EdgeFillet = 0.3;
// 端面倒角 | Edge chamfer
EdgeChamfer = 0.6;

/*[铰链参数 | Hinge Parameters]*/
// 铰链交错组数；总节数 = 2*n+1 | Hinge groups; segment count = 2*n+1
HingeGroupNumber = 3;
// 铰链外径 | Outer diameter of the hinge knuckles
HingeOuterDiameter = 5;
// 铰链轴的名义直径 | Nominal hinge pin diameter
HingeInnerDiameter = 3;
// 铰链径向及轴向配合公差 | Hinge fit and axial clearance
HingeTolerance = 0.5;

/*[磁铁参数 | Magnet Parameters]*/
// 中间扇片的长磁铁尺寸 | Long magnet in the centre panel
BackMagnetLength = 10;
BackMagnetWidth = 2;
BackMagnetHeight = 40;
BackMagnetDepth = 0.8;
BackMagnetTolerance = 0.2;
BackMagnetHeightTolerance = 0.4;
// 端部小磁铁：下端 | Small closure magnets: lower end
BottomMagnetLength = 5;
BottomMagnetWidth = 1;
BottomMagnetHeight = 10;
BottomMagnetDepth = 0.8;
BottomMagnetTolerance = 0.25;
BottomMagnetHeightTolerance = 0.2;
// 端部小磁铁：上端 | Small closure magnets: upper end
UpperMagnetLength = 5;
UpperMagnetWidth = 1;
UpperMagnetHeight = 10;
UpperMagnetDepth = 0.8;
UpperMagnetTolerance = 0.3;
UpperMagnetHeightTolerance = 0.2;
// 小磁铁距上下端面的距离 | Offset of the small magnets from the ends
BottomUpperMagnetPosition = 5;

/*[哨片夹参数 | Reed Clamp Parameters]*/
// 弹性夹在壁面前方的高度 | Projection of the reed clamp
ClampHeight = 5;
// 弹性夹内圆半径 | Inner radius of the reed clamp
ClampRadius = 2.3;
// 弹性夹沿哨片方向的长度 | Length of the reed clamp
ClampLength = 11.5;
// 弹性夹入口斜坡角 | Entry ramp angle
ClampRampAngle = 45;
// 弹性夹壁厚 | Reed clamp thickness
ClampThickness = 1;

/*[开盒槽参数 | Opening Slot Parameters]*/
// 开盒槽宽度 | Opening slot width
OpenSlotWidth = 6;
// 开盒槽长度 | Opening slot length
OpenSlotLength = 24;
// 开盒槽深度 | Opening slot depth
OpenSlotDepth = 3;
// 开盒槽距自由边的偏移 | Opening slot offset from the free edge
OpenSlotPosition = 1;

/*[内部参数 | Internal Parameters]*/
Width = 2 * Radius * sin(180 / EdgesNumber);
TriangleH = Radius * cos(180 / EdgesNumber);
BlendingHeight = (TriangleH - WallThickness) * tan(BlendingAngle);
TotalHeight = FloorThickness + InnerHeight + BlendingHeight + CeilingThickness;
HingeLength = TotalHeight / (2 * HingeGroupNumber + 1);
HalfBodyWidth = (Width - PanelClearance) / 2;
HalfHingeSpacing = Width / 2;
MiterSlope = tan(180 / EdgesNumber);
TipY = TriangleH - CenterClearance;
TipHalfWidth = HalfHingeSpacing - TipY * MiterSlope;
KnuckleRadius = (HingeOuterDiameter - HingeTolerance / 2) / 2;
KnuckleReliefRadius = (HingeOuterDiameter + HingeTolerance / 2) / 2;
BackY = -KnuckleRadius;
TransitionZ = FloorThickness + InnerHeight;
CapZ = TransitionZ + BlendingHeight;
Epsilon = 0.02;
JoinOverlap = 0.3;
StapleSlotRadius = 3.5;
StapleCenterY = WallThickness + StapleSlotRadius;
StapleTopY = WallThickness + 6.218;
StapleOuterHalfWidth = HalfHingeSpacing - StapleTopY * MiterSlope;
// The lip offset and its asymmetrical corner cuts follow the end-panel
// profiles of the reference STEP at z=30 mm.
RightLipY = WallThickness + 0.965;
LeftLipY = RightLipY + 0.23;
RightLipInnerX = HalfHingeSpacing - KnuckleReliefRadius;
LeftLipInnerX = RightLipInnerX - EdgeChamfer;
RightLipOuterInset = 0.214;
LeftLipOuterInset = 0.1;
EndMagnetAlong = RightLipY;
StapleShoulderHalfWidth = HalfHingeSpacing - RightLipY * MiterSlope;
OpenSlotCornerRadius = min(OpenSlotPosition, OpenSlotDepth / 3);
OpenSlotArcRadius = (pow(OpenSlotWidth, 2) + pow(OpenSlotDepth, 2)) /
                    (2 * OpenSlotDepth);
OpenSlotArcStart = atan2(OpenSlotArcRadius - OpenSlotDepth, OpenSlotWidth);
ClampStartZ = FloorThickness + (InnerHeight - ClampLength) / 2 - 1.25;
ClampCenterY = WallThickness + ClampHeight -
               (ClampRadius - ClampThickness + 0.2);
ClampBaseHalfWidth = min(HalfBodyWidth - 0.5,
                         ClampRadius + ClampThickness + 2.723);
ClampTipHalfWidth = ClampRadius + ClampThickness / 2;
ClampMouthFlare = 0.07;
ClampEndHeight = 0.25;

function miter_half_width(y) = HalfHingeSpacing - y * MiterSlope;

// The free edge follows the closed polygon's mating plane. At a hinge,
// the cap stops at the pin centre and the alternating knuckles form the rim.
module case_outline_2d(kind) {
    offset(r = EdgeFillet)
        offset(delta = -EdgeFillet)
            polygon(kind == "left" ? [
                [-miter_half_width(BackY), BackY],
                [HalfHingeSpacing, BackY],
                [HalfHingeSpacing, 0],
                [TipHalfWidth, TipY],
                [-TipHalfWidth, TipY],
                [-HalfHingeSpacing, 0]
            ] : kind == "right" ? [
                [-HalfHingeSpacing, BackY],
                [miter_half_width(BackY), BackY],
                [HalfHingeSpacing, 0],
                [TipHalfWidth, TipY],
                [-TipHalfWidth, TipY],
                [-HalfHingeSpacing, 0]
            ] : [
                [-HalfHingeSpacing, BackY],
                [HalfHingeSpacing, BackY],
                [HalfHingeSpacing, 0],
                [TipHalfWidth, TipY],
                [-TipHalfWidth, TipY],
                [-HalfHingeSpacing, 0]
            ]);
}

module back_wall_2d(kind) {
    // The end lips and their small corner chamfers are measured from the
    // v4-7 STEP sections at z=30 mm. Both exterior edges remain on the
    // same polygon mating plane as the caps.
    polygon(kind == "left" ? [
        [-miter_half_width(BackY), BackY],
        [HalfBodyWidth, BackY],
        [HalfBodyWidth, WallThickness],
        [-LeftLipInnerX, WallThickness],
        [-LeftLipInnerX, LeftLipY - 0.1],
        [-LeftLipInnerX - 0.1, LeftLipY],
        [-miter_half_width(LeftLipY) + LeftLipOuterInset, LeftLipY],
        [-miter_half_width(LeftLipY - 0.193), LeftLipY - 0.193]
    ] : kind == "right" ? [
        [-HalfBodyWidth, BackY],
        [miter_half_width(BackY), BackY],
        [miter_half_width(RightLipY - 0.09), RightLipY - 0.09],
        [miter_half_width(RightLipY) - RightLipOuterInset, RightLipY],
        [RightLipInnerX + 0.1, RightLipY],
        [RightLipInnerX, RightLipY - 0.1],
        [RightLipInnerX, WallThickness],
        [-HalfBodyWidth, WallThickness]
    ] : [
        [-HalfBodyWidth, BackY],
        [HalfBodyWidth, BackY],
        [HalfBodyWidth, WallThickness],
        [-HalfBodyWidth, WallThickness]
    ]);
}

module floor_cap(kind) {
    hull() {
        linear_extrude(Epsilon)
            offset(delta = -EdgeChamfer)
                case_outline_2d(kind);
        translate([0, 0, EdgeChamfer])
            linear_extrude(Epsilon)
                case_outline_2d(kind);
    }
    translate([0, 0, EdgeChamfer])
        linear_extrude(FloorThickness - 2 * EdgeChamfer)
            case_outline_2d(kind);
    hull() {
        translate([0, 0, FloorThickness - EdgeChamfer - Epsilon])
            linear_extrude(Epsilon) case_outline_2d(kind);
        translate([0, 0, FloorThickness - Epsilon])
            linear_extrude(Epsilon)
                offset(delta = -EdgeChamfer)
                    case_outline_2d(kind);
    }
}

module ceiling_cap(kind) {
    translate([0, 0, CapZ])
        linear_extrude(CeilingThickness - EdgeChamfer)
            case_outline_2d(kind);
    hull() {
        translate([0, 0, TotalHeight - EdgeChamfer - Epsilon])
            linear_extrude(Epsilon)
                case_outline_2d(kind);
        translate([0, 0, TotalHeight - Epsilon])
            linear_extrude(Epsilon)
                offset(delta = -EdgeChamfer)
                    case_outline_2d(kind);
    }
}

module upper_transition(kind) {
    // A convex loft alone crosses the panel's mating planes near the hinge.
    // Keep every roof section inside the same polygon sector as the cap.
    intersection() {
        hull() {
            translate([0, 0, TransitionZ])
                linear_extrude(Epsilon) back_wall_2d(kind);
            translate([0, 0, CapZ - Epsilon])
                linear_extrude(Epsilon)
                    case_outline_2d(kind);
        }
        translate([0, 0, TransitionZ - Epsilon])
            linear_extrude(BlendingHeight + 2 * Epsilon)
                case_outline_2d(kind);
    }
}

module staple_bracket() {
    // Positive six-sided brace, embedded in both the floor and the wall.
    translate([0, 0, FloorThickness - EdgeChamfer])
        linear_extrude(StapleSlotHeight)
            polygon([
                [-StapleShoulderHalfWidth, WallThickness - JoinOverlap],
                [StapleShoulderHalfWidth, WallThickness - JoinOverlap],
                [StapleShoulderHalfWidth, WallThickness + 0.965],
                [StapleOuterHalfWidth, StapleTopY],
                [-StapleOuterHalfWidth, StapleTopY],
                [-StapleShoulderHalfWidth, WallThickness + 0.965]
            ]);
}

module staple_slot_cut() {
    // A semicircular seat and widening mouth cut through brace and wall.
    translate([0, 0, FloorThickness - Epsilon])
        linear_extrude(StapleSlotHeight - EdgeChamfer + 2 * Epsilon)
            union() {
                translate([0, StapleCenterY]) circle(r = StapleSlotRadius);
                polygon([
                    [-StapleSlotRadius, StapleCenterY],
                    [StapleSlotRadius, StapleCenterY],
                    [StapleSlotRadius, StapleCenterY + 2.2],
                    [StapleOuterHalfWidth - JoinOverlap, StapleTopY + Epsilon],
                    [-StapleOuterHalfWidth + JoinOverlap, StapleTopY + Epsilon],
                    [-StapleSlotRadius, StapleCenterY + 2.2]
                ]);
            }
}

module staple_mandrel() {
    translate([0, StapleCenterY, FloorThickness - JoinOverlap])
        cylinder(h = StapleMandrelHeight + JoinOverlap, d = 4.4);
}

module clamp_profile_2d() {
    // An outer trapezoid minus a circular saddle and its straight opening.
    // The back of the trapezoid overlaps the wall by JoinOverlap.
    difference() {
        polygon([
            [-ClampBaseHalfWidth, WallThickness - JoinOverlap],
            [ClampBaseHalfWidth, WallThickness - JoinOverlap],
            [ClampTipHalfWidth, WallThickness + ClampHeight],
            [-ClampTipHalfWidth, WallThickness + ClampHeight]
        ]);
        union() {
            translate([0, ClampCenterY]) circle(r = ClampRadius);
            polygon([
                [-ClampRadius, ClampCenterY],
                [ClampRadius, ClampCenterY],
                [ClampRadius + ClampMouthFlare,
                 WallThickness + ClampHeight + Epsilon],
                [-ClampRadius - ClampMouthFlare,
                 WallThickness + ClampHeight + Epsilon]
            ]);
        }
    }
}

module clamp_ramp_cuts() {
    ramp_run = (ClampHeight - ClampEndHeight) / tan(ClampRampAngle);
    top = WallThickness + ClampHeight;
    // Two triangular prisms remove the front of each end of the clamp.
    // In the rotated sketch, horizontal coordinates are negative Z.
    translate([-ClampBaseHalfWidth - Epsilon, 0, ClampStartZ])
        rotate([0, 90, 0])
            linear_extrude(2 * ClampBaseHalfWidth + 2 * Epsilon)
                union() {
                    polygon([
                        [Epsilon, WallThickness + ClampEndHeight],
                        [Epsilon, top + Epsilon],
                        [-ramp_run - Epsilon, top + Epsilon]
                    ]);
                    polygon([
                        [-ClampLength - Epsilon, WallThickness + ClampEndHeight],
                        [-ClampLength - Epsilon, top + Epsilon],
                        [-ClampLength + ramp_run + Epsilon, top + Epsilon]
                    ]);
                }
}

module reed_clamp() {
    difference() {
        translate([0, 0, ClampStartZ])
            linear_extrude(ClampLength)
                clamp_profile_2d();
        clamp_ramp_cuts();
    }
}

module panel_structure(kind) {
    union() {
        difference() {
            union() {
                // The straight wall ends where the roof transition starts.
                // Extending it into the sloped roof blocks the hinge sweep.
                translate([0, 0, EdgeChamfer])
                    linear_extrude(TransitionZ - EdgeChamfer + Epsilon)
                        back_wall_2d(kind);
                floor_cap(kind);
                staple_bracket();
                reed_clamp();
                upper_transition(kind);
                ceiling_cap(kind);
            }
            staple_slot_cut();
        }
        staple_mandrel();
    }
}

// Even sections have a male knuckle; odd sections have a female knuckle.
// The continuous male pin is printed inside the adjacent female rings.
module hinge_clearances(kind) {
    for (section = [0 : 2 * HingeGroupNumber]) {
        side_x = section % 2 == 0 ? -HalfHingeSpacing : HalfHingeSpacing;
        needs_clearance = section % 2 == 0 ? kind != "left" : kind != "right";
        if (needs_clearance)
            translate([side_x, 0, section * HingeLength - Epsilon])
                cylinder(
                    h = HingeLength + 2 * Epsilon,
                    r = KnuckleReliefRadius
                );
        // The through opening grows by 0.6 mm at the end face, just as
        // the floor/ceiling outline retreats by the same chamfer width.
        if (needs_clearance && section == 0)
            translate([side_x, 0, -Epsilon])
                cylinder(h = EdgeChamfer + Epsilon,
                         r1 = KnuckleReliefRadius + EdgeChamfer + Epsilon,
                         r2 = KnuckleReliefRadius);
        if (needs_clearance && section == 2 * HingeGroupNumber)
            translate([side_x, 0, TotalHeight - EdgeChamfer])
                cylinder(h = EdgeChamfer + Epsilon,
                         r1 = KnuckleReliefRadius,
                         r2 = KnuckleReliefRadius + EdgeChamfer + Epsilon);
    }
}

module hinge_knuckles(kind) {
    if (kind != "right") {
        // The pin runs through all the gaps between the four male knuckles.
        translate([HalfHingeSpacing, 0, 0])
            cylinder(h = TotalHeight, d = HingeInnerDiameter - HingeTolerance / 2);
        for (section = [0 : 2 : 2 * HingeGroupNumber]) {
            first = section == 0;
            last = section == 2 * HingeGroupNumber;
            start_z = first ? EdgeChamfer :
                      section * HingeLength + HingeTolerance / 2;
            end_z = last ? TotalHeight - EdgeChamfer :
                    (section + 1) * HingeLength - HingeTolerance / 2;
            translate([HalfHingeSpacing, 0, start_z])
                cylinder(h = end_z - start_z, r = KnuckleRadius);
            if (first)
                translate([HalfHingeSpacing, 0, 0])
                    cylinder(h = EdgeChamfer,
                             r1 = KnuckleRadius - EdgeChamfer,
                             r2 = KnuckleRadius);
            if (last)
                translate([HalfHingeSpacing, 0, TotalHeight - EdgeChamfer])
                    cylinder(h = EdgeChamfer,
                             r1 = KnuckleRadius,
                             r2 = KnuckleRadius - EdgeChamfer);
        }
    }
    if (kind != "left")
        for (section = [1 : 2 : 2 * HingeGroupNumber - 1])
            translate([-HalfHingeSpacing, 0, section * HingeLength + HingeTolerance / 2])
                cylinder(h = HingeLength - HingeTolerance,
                         r = KnuckleRadius);
}

module female_holes(kind) {
    if (kind != "left")
        // Keep the pin channel open through the wall at every section seam.
        // A hole limited to the female rings fuses adjacent panels to the pin.
        translate([-HalfHingeSpacing, 0, -Epsilon])
            cylinder(h = TotalHeight + 2 * Epsilon,
                     d = HingeInnerDiameter + HingeTolerance / 2);
}

module long_magnet_pocket() {
    translate([0, BackY + BackMagnetDepth +
               (BackMagnetWidth + BackMagnetTolerance) / 2, TotalHeight / 2])
        cube([BackMagnetLength + BackMagnetTolerance,
              BackMagnetWidth + BackMagnetTolerance,
              BackMagnetHeight + BackMagnetHeightTolerance], center = true);
}

module end_magnet_pockets(kind) {
    sign = kind == "left" ? -1 : 1;
    angle = 90 + sign * 180 / EdgesNumber;
    tangent = [-sign * sin(180 / EdgesNumber),
               cos(180 / EdgesNumber)];
    normal = [sign * cos(180 / EdgesNumber),
              sin(180 / EdgesNumber)];
    for (upper = [false, true]) {
        magnet_length = upper ? UpperMagnetLength : BottomMagnetLength;
        magnet_width = upper ? UpperMagnetWidth : BottomMagnetWidth;
        magnet_height = upper ? UpperMagnetHeight : BottomMagnetHeight;
        tolerance = upper ? UpperMagnetTolerance : BottomMagnetTolerance;
        height_tolerance = upper ? UpperMagnetHeightTolerance : BottomMagnetHeightTolerance;
        depth = upper ? UpperMagnetDepth : BottomMagnetDepth;
        z = upper ? TotalHeight - BottomUpperMagnetPosition - magnet_height / 2
                  : BottomUpperMagnetPosition + magnet_height / 2;
        pocket_width = magnet_width + tolerance;
        // The STEP pockets run along the mating edge and sit below its
        // surface. An axis-aligned cutter breaks the end's planar face.
        translate([sign * HalfHingeSpacing + EndMagnetAlong * tangent[0] -
                   (depth + pocket_width / 2) * normal[0],
                   EndMagnetAlong * tangent[1] -
                   (depth + pocket_width / 2) * normal[1], z])
            rotate([0, 0, angle])
                cube([magnet_length + tolerance, pocket_width,
                      magnet_height + height_tolerance], center = true);
    }
}

module opening_slot_2d() {
    inner_x = HalfHingeSpacing - OpenSlotPosition - OpenSlotWidth;
    start_x = inner_x - OpenSlotCornerRadius;
    end_x = inner_x + OpenSlotWidth;
    arc_y = BackY + OpenSlotDepth - OpenSlotArcRadius;
    steps = 24;
    // A radius-1 inlet and radius-7.5 circular ramp reproduce the v4-7
    // opening slot. The arc radius follows from its width and depth.
    polygon(concat(
        [[start_x, BackY - OpenSlotDepth],
         [end_x, BackY - OpenSlotDepth]],
        [for (i = [0 : steps])
            [inner_x + OpenSlotArcRadius *
             cos(OpenSlotArcStart + (90 - OpenSlotArcStart) * i / steps),
             arc_y + OpenSlotArcRadius *
             sin(OpenSlotArcStart + (90 - OpenSlotArcStart) * i / steps)]],
        [for (i = [0 : steps])
            [start_x + OpenSlotCornerRadius * cos(-90 * i / steps),
             BackY + OpenSlotCornerRadius +
             OpenSlotCornerRadius * sin(-90 * i / steps)]]
    ));
}

module opening_slot(kind) {
    sign = kind == "left" ? -1 : 1;
    translate([0, 0, (TotalHeight - OpenSlotLength) / 2])
        linear_extrude(OpenSlotLength)
            scale([sign, 1]) opening_slot_2d();
}

// Reusable part module. "middle" is used four times in the seven-panel case.
module reed_case_panel(kind = "middle") {
    assert(kind == "left" || kind == "right" ||
           kind == "middle" || kind == "center", "Unknown panel kind");
    // Resolve all booleans per panel for stable F5 views at grazing angles.
    render(convexity = 10) difference() {
        union() {
            difference() {
                panel_structure(kind);
                hinge_clearances(kind);
            }
            hinge_knuckles(kind);
        }
        female_holes(kind);
        if (kind == "center") long_magnet_pocket();
        if (kind == "left" || kind == "right") {
            end_magnet_pockets(kind);
            opening_slot(kind);
        }
    }
}

function panel_kind(index) =
    index == 0 ? "left" :
    index == EdgesNumber - 1 ? "right" :
    index == floor(EdgesNumber / 2) ? "center" : "middle";

module reed_case_flat() {
    for (index = [0 : EdgesNumber - 1])
        translate([(index - (EdgesNumber - 1) / 2) * Width, 0, 0])
            reed_case_panel(panel_kind(index));
}

module reed_case_closed() {
    for (index = [0 : EdgesNumber - 1]) {
        angle = 360 * index / EdgesNumber;
        translate([TriangleH * cos(angle), TriangleH * sin(angle), 0])
            rotate([0, 0, angle + 90])
                reed_case_panel(panel_kind(index));
    }
}

assert(EdgesNumber >= 5 && EdgesNumber % 2 == 1,
       "EdgesNumber must be an odd integer of at least five");
assert(Radius > 0 && InnerHeight > StapleSlotHeight &&
       FloorThickness > 2 * EdgeChamfer && CeilingThickness > EdgeChamfer &&
       WallThickness > 0 && ClampRampAngle > 0 && ClampRampAngle < 90,
       "Case dimensions must be positive and the staple slot must fit");
assert(HingeGroupNumber >= 1 && HingeLength > HingeTolerance &&
       HingeLength > EdgeChamfer + HingeTolerance / 2 &&
       KnuckleRadius > EdgeChamfer &&
       HingeOuterDiameter > HingeInnerDiameter + HingeTolerance / 2,
       "Invalid hinge dimensions or clearance");
assert(TipY > 0 && TipHalfWidth > 0 && PanelClearance > 0 &&
       PanelClearance < Width / 4 && BackMagnetDepth >= 0,
       "Invalid panel clearance or centre relief");
assert(ClampEndHeight > 0 && ClampEndHeight < ClampHeight &&
       ClampLength > 2 * (ClampHeight - ClampEndHeight) / tan(ClampRampAngle) &&
       ClampThickness > 2 * ClampMouthFlare &&
       StapleOuterHalfWidth > StapleSlotRadius &&
       OpenSlotDepth > 0 && OpenSlotWidth > OpenSlotCornerRadius &&
       OpenSlotLength > 0 && OpenSlotPosition > 0 &&
       JoinOverlap < WallThickness &&
       StapleSlotHeight + FloorThickness < TransitionZ,
       "Clamp ramps or staple holder do not fit within the panel");

if (Part == "assembly") {
    if (AssemblyView == "flat") reed_case_flat();
    else reed_case_closed();
} else {
    reed_case_panel(Part);
}

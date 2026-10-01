// OpenReed polygon reed case
// Rebuilt from OboeReedHexCase/v4-7. All dimensions are in millimetres.

$fa = 0.5;
$fs = 0.1;

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
// 顶部斜面根部圆角 | Fillet at the root of the roof slope
RoofBlendRadius = 5;
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
// 圆槽包角；大于 180° 形成收紧的喉口 | Retained groove arc
ClampGripAngle = 210;
// 夹片外侧与根部的过渡圆角 | Outer clamp root blend
ClampOuterBlendRadius = 5.158923;

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
TipFillet = CenterClearance * sin(180 / EdgesNumber) /
            (1 - sin(180 / EdgesNumber));
TipCenterY = TipY - TipFillet;
KnuckleRadius = (HingeOuterDiameter - HingeTolerance / 2) / 2;
KnuckleReliefRadius = (HingeOuterDiameter + HingeTolerance / 2) / 2;
BackY = -KnuckleRadius;
TransitionZ = FloorThickness + InnerHeight;
Epsilon = 0.001;
JoinOverlap = 0.3;
StapleSlotRadius = 3.5;
StapleCenterY = WallThickness + StapleSlotRadius;
StapleTopY = StapleCenterY + 2.2 +
             (HalfHingeSpacing - (StapleCenterY + 2.2) * MiterSlope -
              StapleSlotRadius) / (1 / MiterSlope + MiterSlope);
StapleOuterHalfWidth = HalfHingeSpacing - StapleTopY * MiterSlope;
// The lip offset and its asymmetrical corner cuts follow the end-panel
// profiles of the reference STEP at z=30 mm.
// Intersection of the mating plane with the hinge relief circle.
RightLipY = KnuckleReliefRadius * cos(180 / EdgesNumber);
LeftLipY = RightLipY + 0.23;
RightLipInnerX = HalfHingeSpacing - KnuckleReliefRadius;
LeftLipInnerX = RightLipInnerX - EdgeChamfer;
RightLipOuterInset = 0.214;
LeftLipOuterInset = 0.1;
EndMagnetAlong = RightLipY;
OpenSlotCornerRadius = min(OpenSlotPosition, OpenSlotDepth / 3);
OpenSlotArcRadius = (pow(OpenSlotWidth, 2) + pow(OpenSlotDepth, 2)) /
                    (2 * OpenSlotDepth);
OpenSlotArcStart = atan2(OpenSlotArcRadius - OpenSlotDepth, OpenSlotWidth);
ClampStartZ = FloorThickness + (InnerHeight - ClampLength) / 2 - 1.25;
ClampCenterY = WallThickness + ClampHeight -
               (ClampRadius - ClampThickness + 0.2);
ClampBaseHalfWidth = HalfHingeSpacing -
                    sqrt(pow(KnuckleReliefRadius, 2) - pow(WallThickness, 2));
ClampLipAngle = (ClampGripAngle - 180) / 2;
RoofRootZ = TransitionZ - RoofBlendRadius * tan(BlendingAngle / 2);
RoofTangentY = WallThickness + RoofBlendRadius * (1 - cos(BlendingAngle));
// The STEP uses unequal setbacks on the roof and the vertical mating face.
// Measured side setback / roof setback = 0.930274118 / 0.6.
RoofSideChamferRatio = 1.55045686345737;
RoofNormalDot = sin(BlendingAngle) * sin(180 / EdgesNumber);
RoofChamferDepth = EdgeChamfer * sqrt(1 - pow(RoofNormalDot, 2)) /
                   cos(180 / EdgesNumber);
RoofChamferSlope = RoofSideChamferRatio * cos(180 / EdgesNumber) /
                   cos(BlendingAngle);
RoofChamferRise = RoofChamferDepth * RoofChamferSlope;

// Keep circular primitives on a shared grid, including the cardinal axes.
function circle_segments(r) = 4 * ceil(max(5, min(360 / $fa, 2 * PI * r / $fs)) / 4);
KnuckleSegments = circle_segments(KnuckleRadius);
ReliefSegments = max(360, circle_segments(KnuckleReliefRadius + EdgeChamfer));
// A circumscribed cutter preserves the specified minimum radial clearance.
// An inscribed circle leaves tiny wedges at the mating-plane intersection.
ReliefCutterRadius = KnuckleReliefRadius / cos(180 / ReliefSegments);
SlotSegments = circle_segments(StapleSlotRadius + EdgeChamfer);
MandrelSegments = circle_segments(2.2);

function miter_half_width(y) = HalfHingeSpacing - y * MiterSlope;
function arc_points(c, r, a, b) =
    let(steps = max(1, ceil(abs(b - a) /
        min($fa, $fs / r * 180 / PI))))
    [for (i = [0 : steps])
        c + r * [cos(a + (b - a) * i / steps),
                 sin(a + (b - a) * i / steps)]];
function mirror_points(points) =
    [for (i = [len(points) - 1 : -1 : 0]) [-points[i][0], points[i][1]]];

// The free edge follows the closed polygon's mating plane. At a hinge,
// the cap stops at the pin centre and the alternating knuckles form the rim.
module case_outline_2d(kind) {
    theta = 180 / EdgesNumber;
    tip = arc_points([0, TipCenterY], TipFillet, theta, 180 - theta);
    // The free edge is planar all the way to the back corner. Only the
    // nose has a vertical fillet; the end faces receive planar chamfers.
    polygon(concat(
        [[kind == "left" ? -miter_half_width(BackY) : -HalfHingeSpacing, BackY],
         [kind == "right" ? miter_half_width(BackY) : HalfHingeSpacing, BackY],
         [HalfHingeSpacing, 0]], tip, [[-HalfHingeSpacing, 0]]
    ));
}

module back_wall_2d(kind) {
    // The end lips and their small corner chamfers are measured from the
    // v4-7 STEP sections at z=30 mm. Both exterior edges remain on the
    // same polygon mating plane as the caps.
    intersection() {
        case_outline_2d(kind);
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
}

module floor_cap(kind) {
    difference() {
        linear_extrude(FloorThickness) case_outline_2d(kind);
        cap_chamfer_cuts(FloorThickness, bottom = true);
    }
}

module edge_chamfer_cut(normal_angle, plane_distance, height, bottom = false) {
    // Sketch coordinates are the outward normal coordinate and Z.
    // Cutting a plane preserves the rounded nose, unlike shrinking the
    // entire outline (which incorrectly chamfers that nose a second time).
    rotate([0, 0, normal_angle - 90])
        translate([-Width, 0, 0])
            rotate([90, 0, 90])
                linear_extrude(2 * Width)
                    polygon(bottom ? [
                        [plane_distance - EdgeChamfer - Epsilon, -Epsilon],
                        [plane_distance + Width, -Epsilon],
                        [plane_distance + Width, EdgeChamfer + Width]
                    ] : [
                        [plane_distance - EdgeChamfer - Epsilon, height + Epsilon],
                        [plane_distance + Width, height + Epsilon],
                        [plane_distance + Width, height - EdgeChamfer - Width]
                    ]);
}

module cap_chamfer_cuts(height, bottom = false) {
    for (angle = [180 / EdgesNumber, 180 - 180 / EdgesNumber]) {
        edge_chamfer_cut(angle, HalfHingeSpacing * cos(180 / EdgesNumber), height);
        if (bottom)
            edge_chamfer_cut(angle, HalfHingeSpacing * cos(180 / EdgesNumber),
                             height, bottom = true);
    }
    edge_chamfer_cut(-90, -BackY, height);
    if (bottom) edge_chamfer_cut(-90, -BackY, height, bottom = true);
}

module upper_transition(kind) {
    // A sector prism minus the roof cavity gives a true constant-angle roof.
    // Its root is a circular arc tangent to both the wall and the roof.
    difference() {
        translate([0, 0, RoofRootZ - Epsilon])
            linear_extrude(TotalHeight - RoofRootZ + Epsilon)
                case_outline_2d(kind);
        roof_cavity();
        roof_side_chamfer_cuts();
        cap_chamfer_cuts(TotalHeight);
    }
}

module roof_cavity() {
    translate([-Width, 0, 0])
        rotate([90, 0, 90])
            linear_extrude(2 * Width)
                polygon(concat(
                    [[WallThickness, -Epsilon]],
                    arc_points([WallThickness + RoofBlendRadius, RoofRootZ],
                               RoofBlendRadius, 180, 180 - BlendingAngle),
                    [[TipY + 1, TransitionZ +
                      (TipY + 1 - WallThickness) * tan(BlendingAngle)],
                     [TipY + 1, -Epsilon]]));
}

module roof_side_chamfer_cuts() {
    // Each cutter is one planar wedge. Restrict it to the forward branch
    // of the root fillet so the plane does not cut the wall's tangent point.
    y0 = WallThickness + RoofBlendRadius * (1 - cos(BlendingAngle / 2));
    y1 = TipY + 1;
    x1 = HalfHingeSpacing + KnuckleReliefRadius;
    function roof_edge_z(x, y) = TransitionZ +
        (y - WallThickness) * tan(BlendingAngle) + RoofChamferRise -
        RoofChamferSlope * (HalfHingeSpacing - x - y * MiterSlope);
    for (side = [-1, 1])
        scale([side, 1, 1])
            polyhedron(points = [
                [0, y0, -TotalHeight], [x1, y0, -TotalHeight],
                [x1, y1, -TotalHeight], [0, y1, -TotalHeight],
                [0, y0, roof_edge_z(0, y0)],
                [x1, y0, roof_edge_z(x1, y0)],
                [x1, y1, roof_edge_z(x1, y1)],
                [0, y1, roof_edge_z(0, y1)]
            ], faces = [
                [1, 2, 3, 0], [7, 6, 5, 4],
                [4, 5, 1, 0], [5, 6, 2, 1],
                [6, 7, 3, 2], [7, 4, 0, 3]
            ]);
}

module staple_outline_2d() {
    // Both sides lie on exactly the same mating planes as the floor.
    polygon([
        [-miter_half_width(WallThickness - JoinOverlap), WallThickness - JoinOverlap],
        [miter_half_width(WallThickness - JoinOverlap), WallThickness - JoinOverlap],
        [StapleOuterHalfWidth, StapleTopY],
        [-StapleOuterHalfWidth, StapleTopY]
    ]);
}

module staple_bracket() {
    top_z = FloorThickness + StapleSlotHeight;
    difference() {
        union() {
            translate([0, 0, FloorThickness - EdgeChamfer])
                linear_extrude(StapleSlotHeight + EdgeChamfer)
                    staple_outline_2d();
        }
        // Bevel the exposed sides; the embedded back edge stays joined
        // to the wall instead of retreating from it at the top.
        for (angle = [180 / EdgesNumber, 180 - 180 / EdgesNumber])
            edge_chamfer_cut(angle,
                HalfHingeSpacing * cos(180 / EdgesNumber), top_z);
        edge_chamfer_cut(90, StapleTopY, top_z);
        // Cut the brace before merging it into the floor. The floor then
        // retains its continuous upper chamfer underneath the flared mouth.
        translate([0, 0, FloorThickness - EdgeChamfer - Epsilon])
            linear_extrude(StapleSlotHeight + EdgeChamfer + 2 * Epsilon)
                union() {
                    translate([0, StapleCenterY])
                        circle(r = StapleSlotRadius, $fn = SlotSegments);
                    staple_mouth_2d();
                }
    }
}

module staple_mouth_component_2d(flare = false, expansion = 0) {
    beyond_y = StapleTopY + 2 * EdgeChamfer;
    beyond_x = StapleSlotRadius + (beyond_y - StapleCenterY - 2.2) / MiterSlope;
    // A rectangle and a convex flare keep each chamfer loft convex.
    if (flare)
        offset(delta = expansion)
            polygon([
                [-StapleSlotRadius, StapleCenterY + 2.2],
                [StapleSlotRadius, StapleCenterY + 2.2],
                [beyond_x, beyond_y], [-beyond_x, beyond_y]
            ]);
    else
        // Keep the back at the circle's tangent line when widening the
        // mouth. Offsetting it backwards creates square corners in the seat.
        polygon([
            [-StapleSlotRadius - expansion, StapleCenterY],
            [StapleSlotRadius + expansion, StapleCenterY],
            [StapleSlotRadius + expansion, beyond_y],
            [-StapleSlotRadius - expansion, beyond_y]
        ]);
}

module staple_mouth_2d() {
    union() {
        staple_mouth_component_2d();
        staple_mouth_component_2d(flare = true);
    }
}

module staple_slot_cut() {
    top_z = FloorThickness + StapleSlotHeight;
    translate([0, 0, FloorThickness])
        linear_extrude(StapleSlotHeight - EdgeChamfer + Epsilon)
            union() {
                translate([0, StapleCenterY]) circle(r = StapleSlotRadius, $fn = SlotSegments);
                staple_mouth_2d();
            }
    translate([0, StapleCenterY, top_z - EdgeChamfer])
        cylinder(h = EdgeChamfer,
                 r1 = StapleSlotRadius,
                 r2 = StapleSlotRadius + EdgeChamfer, $fn = SlotSegments);
    // Chamfer the straight and flared mouth separately from the circle.
    for (flare = [false, true])
        hull() {
            translate([0, 0, top_z - EdgeChamfer - Epsilon])
                linear_extrude(Epsilon) staple_mouth_component_2d(flare);
            translate([0, 0, top_z])
                linear_extrude(Epsilon)
                    staple_mouth_component_2d(flare, expansion = EdgeChamfer);
        }
}

module staple_mandrel() {
    translate([0, StapleCenterY, FloorThickness - JoinOverlap])
        cylinder(h = StapleMandrelHeight + JoinOverlap - EdgeChamfer, d = 4.4, $fn = MandrelSegments);
    translate([0, StapleCenterY, FloorThickness + StapleMandrelHeight - EdgeChamfer])
        cylinder(h = EdgeChamfer, r1 = 2.2, r2 = 2.2 - EdgeChamfer, $fn = MandrelSegments);
}

module clamp_profile_2d() {
    // Tangent lines and circular blends define the two arms. The inner
    // circle retains ClampGripAngle, rather than opening at its diameter.
    n = [cos(ClampLipAngle), sin(ClampLipAngle)];
    lip_y = WallThickness + ClampHeight - EdgeFillet;
    inner_d = ClampRadius + ClampCenterY * n[1];
    inner_lip = [(inner_d + EdgeFillet - lip_y * n[1]) / n[0], lip_y];
    outer_lip = inner_lip + [(ClampThickness - 2 * EdgeFillet) / n[0], 0];
    outer_tangent = [(ClampRadius + ClampThickness) / n[0], ClampCenterY];
    root = [ClampBaseHalfWidth, WallThickness];
    root_delta = root - outer_tangent;
    // A tangent from the root exists only outside the blend circle.
    // Limit the radius for wider panels while preserving the v4-7 value.
    root_dot = root_delta[0] * n[0] + root_delta[1] * n[1];
    root_radius = min(ClampOuterBlendRadius,
        root_dot > 0 ? 0.9 * pow(norm(root_delta), 2) / (2 * root_dot)
                     : ClampOuterBlendRadius);
    root_center = outer_tangent + root_radius * n;
    root_vector = root - root_center;
    root_angle = atan2(root_vector[1], root_vector[0]) -
                 acos(root_radius / norm(root_vector));
    root_tangent = root_center + root_radius *
                   [cos(root_angle), sin(root_angle)];
    back_x = root[0] + JoinOverlap * (root[0] - root_tangent[0]) /
             (root_tangent[1] - root[1]);
    outer_arm = concat(
        [[back_x, WallThickness - JoinOverlap], root],
        arc_points(root_center, root_radius,
                   root_angle, ClampLipAngle - 180),
        arc_points(outer_lip, EdgeFillet, ClampLipAngle, 90));
    inner_arc = arc_points([0, ClampCenterY], ClampRadius,
                           ClampLipAngle, -180 - ClampLipAngle);
    inner_lip_arc = arc_points(inner_lip, EdgeFillet, 180 + ClampLipAngle, 90);
    difference() {
        polygon(concat(outer_arm, mirror_points(outer_arm)));
        polygon(concat(inner_arc,
            [for (p = inner_lip_arc) [-p[0], p[1]]],
            [[-inner_lip[0], WallThickness + ClampHeight + 1],
             [inner_lip[0], WallThickness + ClampHeight + 1]],
            [for (i = [len(inner_lip_arc) - 1 : -1 : 0]) inner_lip_arc[i]]));
    }
}

module clamp_ramp_cuts() {
    ramp_run = ClampHeight / tan(ClampRampAngle);
    top = WallThickness + ClampHeight;
    // Two triangular prisms remove the front of each end of the clamp.
    // In the rotated sketch, horizontal coordinates are negative Z.
    translate([-ClampBaseHalfWidth - Epsilon, 0, ClampStartZ])
        rotate([0, 90, 0])
            linear_extrude(2 * ClampBaseHalfWidth + 2 * Epsilon)
                union() {
                    polygon([
                        [Epsilon, WallThickness - Epsilon * tan(ClampRampAngle)],
                        [Epsilon, top + Epsilon],
                        [-ramp_run - Epsilon, top + Epsilon]
                    ]);
                    polygon([
                        [-ClampLength - Epsilon, WallThickness - Epsilon * tan(ClampRampAngle)],
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
                // End lips continue through the roof root and share its
                // top chamfer. They must not be truncated at the fillet.
                difference() {
                    translate([0, 0, EdgeChamfer])
                        linear_extrude(TotalHeight - EdgeChamfer)
                            back_wall_2d(kind);
                    cap_chamfer_cuts(TotalHeight);
                }
                floor_cap(kind);
                staple_bracket();
                reed_clamp();
                upper_transition(kind);
            }
            // The widened top of the seat ends at the inner wall plane.
            // Chamfering the seat must not gouge the wall behind it.
            intersection() {
                staple_slot_cut();
                translate([-Width, WallThickness, -Epsilon])
                    cube([2 * Width, TipY + 1, TotalHeight + 2 * Epsilon]);
            }
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
            translate([side_x, 0, section * HingeLength - HingeTolerance / 2])
                cylinder(
                    h = HingeLength + HingeTolerance,
                    r = ReliefCutterRadius,
                    $fn = ReliefSegments
                );
        // The through opening grows by 0.6 mm at the end face, just as
        // the floor/ceiling outline retreats by the same chamfer width.
        if (needs_clearance && section == 0)
            translate([side_x, 0, -Epsilon])
                cylinder(h = EdgeChamfer + Epsilon,
                         r1 = ReliefCutterRadius + EdgeChamfer + Epsilon,
                         r2 = ReliefCutterRadius, $fn = ReliefSegments);
        if (needs_clearance && section == 2 * HingeGroupNumber)
            translate([side_x, 0, TotalHeight - EdgeChamfer])
                cylinder(h = EdgeChamfer + Epsilon,
                         r1 = ReliefCutterRadius,
                         r2 = ReliefCutterRadius + EdgeChamfer + Epsilon,
                         $fn = ReliefSegments);
    }
}

module hinge_web_2d() {
    // Relief-circle / mating-plane intersection, followed by a tangent
    // from that point to the smaller knuckle circle. These two points
    // define the attachment lip without arbitrary offsets.
    theta = 180 / EdgesNumber;
    tangent_angle = 90 + theta - acos(KnuckleRadius / KnuckleReliefRadius);
    tangent_point = [HalfHingeSpacing + KnuckleRadius * cos(tangent_angle),
                     KnuckleRadius * sin(tangent_angle)];
    root_angle = 180 - asin(WallThickness / KnuckleReliefRadius);
    root_arc = arc_points([HalfHingeSpacing, 0], KnuckleReliefRadius,
                          90 + theta, root_angle);
    polygon(concat(
            [[ClampBaseHalfWidth, BackY],
             [HalfHingeSpacing, BackY], tangent_point],
            [for (i = [0 : len(root_arc) - 2]) root_arc[i]],
            [[ClampBaseHalfWidth, WallThickness]]));
}

module hinge_segment(side, start_z, end_z, first = false, last = false) {
    bottom = first ? 0 : start_z;
    top = last ? TotalHeight : end_z;
    scale([side, 1, 1]) {
        // One revolved radial profile contains the cylinder and both end
        // chamfers, so no separately tessellated cone meets a cylinder.
        translate([HalfHingeSpacing, 0, 0])
            rotate_extrude($fn = KnuckleSegments)
                polygon(concat(
                    [[0, bottom]],
                    first ? [[KnuckleRadius - EdgeChamfer, bottom]] : [],
                    [[KnuckleRadius, start_z], [KnuckleRadius, end_z]],
                    last ? [[KnuckleRadius - EdgeChamfer, top]] : [],
                    [[0, top]]));
        difference() {
            translate([0, 0, bottom])
                linear_extrude(top - bottom) hinge_web_2d();
            for (end = [false, true])
                if (end ? last : first) {
                    lip_angle = 90 + 180 / EdgesNumber -
                                acos(KnuckleRadius / KnuckleReliefRadius);
                    edge_chamfer_cut(lip_angle,
                        HalfHingeSpacing * cos(lip_angle) + KnuckleRadius,
                        TotalHeight, bottom = !end);
                    edge_chamfer_cut(-90, -BackY, TotalHeight, bottom = !end);
                }
        }
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
            hinge_segment(1, start_z, end_z, first, last);
        }
    }
    if (kind != "left")
        for (section = [1 : 2 : 2 * HingeGroupNumber - 1])
            hinge_segment(-1, section * HingeLength + HingeTolerance / 2,
                          (section + 1) * HingeLength - HingeTolerance / 2);
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
assert(TipY > 0 && TipFillet > 0 && PanelClearance > 0 &&
       PanelClearance < Width / 4 && BackMagnetDepth >= 0,
       "Invalid panel clearance or centre relief");
assert(ClampGripAngle > 180 && ClampGripAngle < 270 &&
       ClampLength > 2 * ClampHeight / tan(ClampRampAngle) &&
       ClampThickness > 2 * EdgeFillet &&
       StapleOuterHalfWidth > StapleSlotRadius &&
       OpenSlotDepth > 0 && OpenSlotWidth > OpenSlotCornerRadius &&
       OpenSlotLength > 0 && OpenSlotPosition > 0 &&
       JoinOverlap < WallThickness &&
       StapleSlotHeight + FloorThickness < TransitionZ,
       "Clamp ramps or staple holder do not fit within the panel");
assert(RoofBlendRadius > 0 && RoofRootZ > FloorThickness + StapleSlotHeight &&
       RoofTangentY < TipY && WallThickness < KnuckleReliefRadius,
       "Roof fillet or hinge attachment does not fit");

if (Part == "assembly") {
    if (AssemblyView == "flat") reed_case_flat();
    else reed_case_closed();
} else {
    reed_case_panel(Part);
}

use <hexagon.scad>

module screw_hole_m3(h) {
    // Through screw hole
    translate([0, 0, -0.01])
    cylinder(h=h, d=3.3, $fn=50);

    // Hex nut cutout 
    translate([0, 0, h - 3])
    hull() {
        // Large hex nut
        translate([0, 0, 3])
        linear_extrude(0.01)
        hexagon(inradius=2.85);

        // Small hex nut
        linear_extrude(0.01)
        hexagon(inradius=2.65);
    }

    // Screw head cutout
    translate([0, 0, h - 3])
    cylinder(h=2.61, d=5.5, $fn=50);

    // Bottom screw thread protrusion cutout
    translate([0, 0, -0.01])
    cylinder(h=1.01, d=4.4, $fn=100);
}

screw_hole_m3(h=10);
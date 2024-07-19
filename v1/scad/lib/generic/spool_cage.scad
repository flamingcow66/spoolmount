use <spoolmount_b.scad>
use <../util/torus.scad>

module spool_cage(h=90, ptfe_offset=-10) {
    // TODO: Parameterize diameter

    spoolmount_b();

    // Radial arms out from spoolmount
    for (a = [0 : 45 : 315]) {
        rotate([0, 0, a])
        translate([42, 0, 0]) {
            translate([0, -5, 0])
            cube([61, 10, 5]);

            // Rounded edges
            for (o = [-5, 5]) {
                translate([0, o, 2.5])
                rotate([0, 90, 0])
                scale([1.0, 0.7, 1.0])
                cylinder(h=61, d=5, $fn=50);
            }
        }
    }

    // Cage
    translate([0, 0, 2.5])
    difference() {
        cage_height = h - 4.5;

        // Main cylinder
        cylinder(h=cage_height, d=210, $fn=500);

        // Center through cutout
        translate([0, 0, -1])
        cylinder(h=cage_height + 2, d=204, $fn=500);

        cent = (cage_height % 9) / 2;

        // Row holes 1, 3, ...
        for (a = [14 : 6 : 351]) {
            for (h = [cent + 9 : 18 : cage_height - 5]) {
                rotate([0, 0, a])
                translate([100, 0, h])
                rotate([0, 90, 0])
                cylinder(h=50, d=9, $fn=50);
            }
        }

        // Row holes 2, 4, ...
        for (a = [11 : 6 : 348]) {
            for (h = [cent + 18 : 18 : cage_height - 5]) {
                rotate([0, 0, a])
                translate([100, 0, h])
                rotate([0, 90, 0])
                cylinder(h=50, d=9, $fn=50);
            }
        }

        // Bottom PTFE hole
        rotate([0, 0, -1.5])
        translate([105, 0, (cage_height / 2) - 5 + ptfe_offset])
        rotate([90, 0, 30])
        cylinder(h=50, d=4.2, center=true, $fn=100);

        // Top PTFE hole
        rotate([0, 0, 1.5])
        translate([105, 0, (cage_height / 2) + 5 + ptfe_offset])
        rotate([90, 0, -30])
        cylinder(h=50, d=4.2, center=true, $fn=100);
    }

    // Bottom edge
    translate([0, 0, 2.5])
    torus(r_major=103.5, r_minor=2.5, xs=0.6, $fn=500);

    // Top edge
    translate([0, 0, h - 2])
    torus(r_major=103, r_minor=2, $fn=500);
}

spool_cage();
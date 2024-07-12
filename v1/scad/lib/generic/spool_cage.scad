use <spoolmount_b.scad>
use <../util/torus.scad>

module spool_cage() {
    // TODO: Parameterize diameter and height

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
        // Main cylinder
        cylinder(h=98, d=210, $fn=500);

        // Center through cutout
        translate([0, 0, -1])
        cylinder(h=100, d=204, $fn=500);

        // Row holes 1, 3, ...
        for (a = [14 : 6 : 351]) {
            for (h = [8 : 18 : 82]) {
                rotate([0, 0, a])
                translate([100, 0, h])
                rotate([0, 90, 0])
                cylinder(h=50, d=9, $fn=50);
            }
        }

        // Row holes 2, 4, ...
        for (a = [11 : 6 : 348]) {
            for (h = [17 : 18 : 91]) {
                rotate([0, 0, a])
                translate([100, 0, h])
                rotate([0, 90, 0])
                cylinder(h=50, d=9, $fn=50);
            }
        }

        rotate([0, 0, -1.5])
        translate([105, 0, 43])
        rotate([90, 0, 30])
        cylinder(h=50, d=4.2, center=true, $fn=100);

        rotate([0, 0, 1.5])
        translate([105, 0, 55])
        rotate([90, 0, -30])
        cylinder(h=50, d=4.2, center=true, $fn=100);
    }

    // Bottom edge
    translate([0, 0, 2.5])
    torus(r_major=102.5, r_minor=2.5, $fn=500);

    // Top edge
    translate([0, 0, 100.5])
    torus(r_major=103, r_minor=2, $fn=500);
}

spool_cage();
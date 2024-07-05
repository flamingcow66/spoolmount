use <spoolmount_b.scad>
use <torus.scad>

module spool_holder_simple() {
    spoolmount_b();

    // Fill in spoolmount
    cylinder(h=5, r=25);

    // Main body
    translate([0, 0, 5])
    cylinder(h=115, r=12, $fn=200);

    // Base fan in
    translate([0, 0, 5])
    rotate_extrude($fn=200)
    translate([12, 0])
    difference() {
        square(10);

        translate([10, 10])
        circle(r=10);
    }

    // Cap
    translate([0, 0, 115])
    cylinder(h=5, r=17, $fn=200);

    // Cap fan out
    translate([0, 0, 108])
    rotate_extrude($fn=200)
    translate([12, 0])
    resize([5, 7])
    difference() {
        square(5);

        translate([5, 0])
        circle(r=5);
    }

    // Cap rounded edge
    translate([0, 0, 117.5])
    torus(r_major=17, r_minor=2.5, xs=0.7, $fn=200);
}

spool_holder_simple();
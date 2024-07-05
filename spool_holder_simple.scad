use <spoolmount_b.scad>
use <torus.scad>

module spool_holder_simple() {
    spoolmount_b();

    // Fill in spoolmount
    cylinder(h=5, r=25);

    // Main body
    translate([0, 0, 5])
    cylinder(h=95, r=12, $fn=200);

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
    translate([0, 0, 95])
    cylinder(h=5, r=17, $fn=200);

    // Cap fan out
    translate([0, 0, 90])
    rotate_extrude($fn=200)
    polygon(points=[
        [12, 0],
        [17, 5],
        [12, 5],
    ]);

    // Cap rounded edge
    translate([0, 0, 97.5])
    torus(r_major=17, r_minor=2.5, xs=0.7, $fn=200);
}

spool_holder_simple();
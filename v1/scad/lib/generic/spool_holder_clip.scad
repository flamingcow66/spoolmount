use <spoolmount.scad>
use <../util/torus.scad>

module spool_holder_clip(h) {
    assert(h >= 25, "minimum spool_holder_clip height is 25");

    spoolmount();

    // Fill in spoolmount
    cylinder(h=5, r=26);

    // Main body
    translate([0, 0, 5])
    cylinder(h=h - 5, r=12, $fn=200);

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
    translate([0, 0, h - 5])
    cylinder(h=5, r=17, $fn=200);

    // Cap fan out
    translate([0, 0, h - 10])
    rotate_extrude($fn=200)
    polygon(points=[
        [12, 0],
        [17, 5],
        [12, 5],
    ]);

    // Cap rounded edge
    translate([0, 0, h - 2.5])
    torus(r_major=17, r_minor=2.5, xs=0.7, $fn=200);
}

spool_holder_clip(h=100);

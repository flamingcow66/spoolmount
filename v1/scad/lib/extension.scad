use <spoolmount_a.scad>
use <spoolmount_b.scad>

module extension(h) {
    assert(h >= 23, "minimum extension height is 23");

    // Bottom spoolmount
    spoolmount_b();

    // Top spoolmount
    translate([0, 0, h - 5])
    spoolmount_a();

    // Center cylinder
    cylinder(h=h, r=29, $fn=200);

    // Expansion to support top spoolmount
    translate([0, 0, h - 18])
    rotate_extrude($fn=200)
    polygon(points=[
        [29, 0],
        [42, 13],
        [29, 13],
    ]);
}

extension(h=25);
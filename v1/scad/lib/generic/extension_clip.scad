use <spoolmount.scad>

module extension_clip(h) {
    assert(h >= 14, "minimum extension_clip height is 14");

    // Bottom spoolmount
    spoolmount();

    // Top spoolmount
    translate([0, 0, h - 5])
    spoolmount();

    translate([0, 0, 4]) {
        // Inner center cylinder
        difference() {
            cylinder(h=h - 8, r=29, $fn=200);

            translate([0, 0, -1])
            cylinder(h=h - 6, r=25.1, $fn=200);
        }

        difference() {
            cylinder(h=h - 8, r=42, $fn=200);

            translate([0, 0, -1])
            cylinder(h=h - 6, r=37, $fn=200);
        }
    }

    // Expansion to support top spoolmount
    translate([0, 0, h - 9])
    rotate_extrude($fn=200)
    polygon(points=[
        [29, 0],
        [29, 5],
        [37, 5],
        [37, 0],
        [33, 4],
        [29, 0],
    ]);
}

extension_clip(h=25);

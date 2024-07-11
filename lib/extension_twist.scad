use <spoolmount_twist.scad>

module extension_twist(h, twist) {
    assert(h >= 10, "minimum extension height is 10");

    // Bottom spoolmount twist
    spoolmount_twist();

    // Top spoolmount twist
    translate([0, 0, h])
    rotate([180, 0, twist])
    spoolmount_twist();

    difference() {
        union() {
            // Outer body cylinder
            translate([0, 0, 4.5])
            cylinder(h=h - 9, r=25, $fn=200);

            // Inner body cylinder
            translate([0, 0, 2.5])
            cylinder(h=h - 5, r=23, $fn=200);
        }

        // Inner through cutout
        cylinder(h=h, r=16.25, $fn=200);
    }
}

extension_twist(h=25, twist=30);
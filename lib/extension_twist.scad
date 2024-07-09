use <spoolmount_twist.scad>

module extension_twist(h) {
    assert(h >= 10, "minimum extension height is 10");

    // Bottom spoolmount twist
    spoolmount_twist();

    // Top spoolmount twist
    translate([0, 0, h])
    rotate([180, 0, 0])
    spoolmount_twist();

    // Center cylinder
    translate([0, 0, 5])
    cylinder(h=h - 10, r=24.9, $fn=200);
}

extension_twist(h=25);
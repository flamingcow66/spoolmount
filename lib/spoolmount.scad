use <torus.scad>

module spoolmount() {
    // Ring
    difference() {
        cylinder(h=5, r=42, $fn=200);

        translate([0, 0, -1])
        cylinder(h=7, r=25, $fn=200);
    }

    // Rounded edges
    translate([0, 0, 2.5]) {
        torus(r_major=25, r_minor=2.5, xs=0.7, $fn=200);
        torus(r_major=42, r_minor=2.5, xs=0.7, $fn=200);
    }
}

spoolmount();
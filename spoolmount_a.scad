use <torus.scad>

// SpoolMount fixed side (i.e. attached to printer or enclosure)
module spoolmount_a() {
    // Ring
    difference() {
        cylinder(h=5, r=42, $fn=200);

        translate([0, 0, -1])
        cylinder(h=7, r=25, $fn=200);
    }

    // Hooks
    for (x = [-33, 33]) {
        translate([x, 0, 5])
        rotate([0, -90, 0])
        linear_extrude(6, center=true) {
            polygon(points=[
                [0, 0],
                [0, 4],
                [2, 4],
                [4, 6],
                [5, 6],
                [5, 2],
                [3, 0],
                [0, 0],
            ]);

            translate([3, 2])
            circle(r=2, $fn=50);
        }
    }

    // Locking bump
    translate([0, -30.8, 5])
    rotate([0, -90, 0])
    linear_extrude(6, center=true) {
        polygon(points=[
            [0, 0],
            [1.2, -4],
            [1.2, -5],
            [0, -5],
            [0, 0],
        ]);
    }

    // Rounded edges
    translate([0, 0, 2.5]) {
        // Inside
        torus(r_major=25, r_minor=2.5, xs=0.7, $fn=200);
    
        // Outside
        torus(r_major=42, r_minor=2.5, xs=0.7, $fn=200); // 43.75
    }
}

spoolmount_a();
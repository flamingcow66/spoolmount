use <torus.scad>

module spoolmount() {
    // Ring
    difference() {
        // Cylinder body
        cylinder(h=5, r=42, $fn=200);

        // Central through hole
        translate([0, 0, -1])
        cylinder(h=7, r=25, $fn=200);
    }
    
    for (a = [45 : 90 : 335]) {
        // Locking bumps
        rotate([0, 0, a - 10])
        rotate_extrude(angle=20, $fn=200)
        translate([22.5, 0, 0])
        polygon(points=[
            [2.5, 0],
            [0, 2.5],
            [2.5, 5],
        ]);
        
        // Rounded bump ends
        for (o = [-10, 10]) {
            rotate([0, 0, a + o])
            translate([0, 30, 0])
            scale([0.2, 1.0, 1.0])
            rotate_extrude($fn=200)
            translate([5, 0, 0])
            polygon(points=[
                [0, 0],
                [2.5, 2.5],
                [0, 5],
            ]);
        }
    }

    // Rounded outer edge
    translate([0, 0, 2.5]) {
        torus(r_major=42, r_minor=2.5, xs=0.7, $fn=200);
    }
}

spoolmount();
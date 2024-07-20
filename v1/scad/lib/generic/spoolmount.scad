use <../util/torus.scad>

module spoolmount() {
    difference() {
        // Cylinder body
        cylinder(h=5, r=44, $fn=200);

        // Central through hole
        cylinder(h=5, r=25.1, $fn=200);

        // Cutouts for rounded edges
        for (z = [-1, 4.5]) {
            translate([0, 0, z])
            cylinder(h=1.5, r=25.45, $fn=200);
        }
        
        // Holes
        for (a = [0 : 30 : 330]) {
            rotate([0, 0, a])
            translate([34.75, 0, 0])
            rotate([90, 0, 90])
            linear_extrude(9.25, center=true)
            polygon(points=[
                [4, -1],
                [4, 2],
                [6, 4],
                [6, 6],
                [-6, 6],
                [-6, 4],
                [-4, 2],
                [-4, -1],
            ]);
        }
    }

    intersection() {
        cylinder(h=5, r=25.1, $fn=200);

        for (a = [45 : 90 : 335]) {
            // Locking bumps
            rotate([0, 0, a - 10])
            rotate_extrude(angle=20, $fn=200)
            translate([23.1, 0, 0])
            polygon(points=[
                [2.0, 0],
                [2.0, 0.5],
                [0, 2.5],
                [2.0, 4.5],
                [2.0, 5],
            ]);

            // Rounded bump ends
            for (o = [-10, 10]) {
                rotate([0, 0, a + o])
                translate([0, 30.1, 0])
                scale([0.2, 1.0, 1.0])
                rotate_extrude($fn=200)
                translate([5, 0, 0])
                polygon(points=[
                    [0, 0.5],
                    [2.0, 2.5],
                    [0, 4.5],
                ]);
            }
        }
    }

    // Rounded outer edge
    translate([0, 0, 2.5])
    torus(r_major=44, r_minor=2.5, xs=0.7, $fn=200);

    // Rounded inner edges
    for (z = [0.5, 4.5]) {
        translate([0, 0, z])
        torus(r_major=25.45, r_minor=0.5, xs=0.7, $fn=200);
    }
}

spoolmount();
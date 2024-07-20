use <../util/torus.scad>

module spoolmount(h=5) {
    assert(h >= 5, "minimum spoolmount height is 5");

    difference() {
        union() {
            // Center cylinder body
            cylinder(h=h, r=44, $fn=200);

            if (h > 5) {
                // Outer cylinder body
                translate([0, 0, 2.5])
                cylinder(h=h - 5, r=45.75, $fn=200);
            }
        }

        // Central through hole
        translate([0, 0, -0.01])
        cylinder(h=h + 0.02, r=25.1, $fn=200);

        // Cutouts for rounded edges
        for (z = [-0.01, h - 0.5]) {
            translate([0, 0, z])
            cylinder(h=0.51, r=25.45, $fn=200);
        }
        
        // Holes
        for (a = [0 : 30 : 330]) {
            rotate([0, 0, a])
            translate([34.75, 0, 0]) {
                // Attachment cutout
                rotate([90, 0, 90])
                linear_extrude(9.25, center=true)
                polygon(points=[
                    [4, -1],
                    [4, 2],
                    [6, 4],
                    [6, 5.01],
                    [-6, 5.01],
                    [-6, 4],
                    [-4, 2],
                    [-4, -1],
                ]);

                // Access cutout
                if (h > 5) {
                    difference() {
                        // Main cutout
                        rotate([90, 0, 0])
                        linear_extrude(14, center=true)
                        polygon(points=[
                            [-4.625, 5],
                            [-5.625, 6],
                            [-5.625, max(6, h) + 0.01],
                            [5.625, max(6, h) + 0.01],
                            [5.625, 6],
                            [4.625, 5],
                        ]);

                        // Edge triangles
                        // Cutout from cutout
                        for (xs = [-1, 1]) {
                            rotate([90, 0, 90])
                            linear_extrude(11.25, center=true)
                            polygon(points=[
                                [xs * 6, 5],
                                [xs * 7, 6],
                                [xs * 7, 5],
                            ]);
                        }
                    }
                }
            }
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
    for (z = [2.5, h - 2.5]) {
        translate([0, 0, z])
        torus(r_major=44, r_minor=2.5, xs=0.7, $fn=200);
    }

    // Rounded inner edges
    for (z = [0.5, h - 0.5]) {
        translate([0, 0, z])
        torus(r_major=25.45, r_minor=0.5, xs=0.7, $fn=200);
    }
}

spoolmount();
module ptfe_guide() {
    translate([0, 0, 5])
    difference() {
        hull() {
            for (x = [-22, 22]) {
                for (y = [-4, 4]) {
                    for (z = [-3, 3]) {
                        translate([x, y, z])
                        sphere(d=4, $fn=100);
                    }
                }
            }
        }

        // Screw hole
        {
            // Top hex nut / screw cap head cutout
            translate([0, 0, 3.7])
            linear_extrude(2.61, center=true)
            polygon(points=[
                [-2.8, 1.6175],
                [0, 3.235],
                [2.8, 1.6175],
                [2.8, -1.6175],
                [0, -3.235],
                [-2.8, -1.6175],
            ]);

            // Through hole
            translate([0, 0, 0])
            cylinder(h=10, d=3.2, center=true, $fn=100);

            // Bottom screw thread protrusion cutout
            translate([0, 0, -4.5])
            cylinder(h=1.01, d=4.4, center=true, $fn=100);
        }

        // PTFE holes
        for (x = [-18, -10, 10, 18]) {
            translate([x, 0, 0])
            rotate([90, 0, 0])
            cylinder(h=14, d=4.4, center=true, $fn=100);
        }
    }
}

ptfe_guide();
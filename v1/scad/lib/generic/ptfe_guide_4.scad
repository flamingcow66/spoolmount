use <../util/screw_hole_m3.scad>

module ptfe_guide_4() {
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
        translate([0, 0, -5])
        screw_hole_m3(h=10);

        // PTFE holes
        for (x = [-18, -10, 10, 18]) {
            translate([x, 0, 0])
            rotate([90, 0, 0])
            cylinder(h=14, d=4.4, center=true, $fn=100);
        }
    }
}

ptfe_guide_4();
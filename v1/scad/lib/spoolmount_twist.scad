use <torus.scad>

module spoolmount_twist() {
    difference() {
        union() {
            difference() {
                union() {
                    // Core cylinder body
                    translate([0, 0, 0.5])
                    cylinder(h=4, r=25, $fn=200);

                    // Slightly narrower bottom/top body
                    cylinder(h=5, r=24.65, $fn=200);

                    // Bottom outer rounded edge
                    intersection() {
                        cylinder(h=0.5, r=25, $fn=200);

                        translate([0, 0, 0.5])
                        torus(r_major=24.65, r_minor=0.5, xs=0.7, $fn=200);
                    }

                    // Top outer rounded edge
                    intersection() {
                        translate([0, 0, 4.5])
                        cylinder(h=0.5, r=25, $fn=200);

                        translate([0, 0, 4.5])
                        torus(r_major=24.65, r_minor=0.5, xs=0.7, $fn=200);
                    }
                }

                for (a = [45 : 90 : 335]) {
                    // Slide bump entrance cutout
                    rotate([0, 0, a - 13])
                    rotate_extrude(angle=26, $fn=200)
                    translate([23, 0, 0])
                    polygon(points=[
                        [0, -1],
                        [3, -1],
                        [3, 2.5],
                        [0, 2.5],
                    ]);

                    // Slide cutout
                    rotate([0, 0, a - 40])
                    rotate_extrude(angle=80, $fn=200)
                    translate([23, 0, 0])
                    polygon(points=[
                        [3, 0.5],
                        [2, 0.5],
                        [0, 2.5],
                        [2, 4.5],
                        [3, 4.5],
                    ]);
                }

                // Inner cutout
                translate([0, 0, -1])
                cylinder(h=7, r=18, $fn=200);
            }

            // Locking bumps
            intersection() {
                translate([0, 0, 0.5])
                cylinder(h=4, r=25, $fn=200);

                for (a = [45 : 90 : 335]) {
                    for (o = [-19.15, 19.15]) {
                        rotate([0, 0, a + o])
                        translate([0, 23.9, 0]) {
                            translate([0, 0, 1])
                            rotate([45, 0, 0])
                            cylinder(h=3.5, d=1.1, center=true, $fn=50);

                            translate([0, 0, 4])
                            rotate([-45, 0, 0])
                            cylinder(h=3.5, d=1.1, center=true, $fn=50);
                        }
                    }
                }
            }
        }

        // Rounded cutouts
        for (a = [45 : 90 : 335]) {
            for (o = [-40, -20, 20, 40]) {
                rotate([0, 0, a + o])
                translate([0, 30.5, 0])
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
    }

    // Inner rounded edge
    translate([0, 0, 2.5])
    torus(r_major=18, r_minor=2.5, xs=0.7, $fn=200);
}
            
spoolmount_twist();
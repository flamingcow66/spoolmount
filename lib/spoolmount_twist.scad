module spoolmount_twist() {
    difference() {
        union() {
            difference() {
                // Cylinder body
                cylinder(h=5, r=25, $fn=200);

                for (a = [45 : 90 : 335]) {
                    // Slide bump entrance cutout
                    rotate([0, 0, a - 13])
                    rotate_extrude(angle=26, $fn=200)
                    translate([22.3, 0, 0])
                    polygon(points=[
                        [0, -1],
                        [3, -1],
                        [3, 2.5],
                        [0, 2.5],
                    ]);

                    // Slide cutout
                    rotate([0, 0, a - 40])
                    rotate_extrude(angle=80, $fn=200)
                    translate([22.5, 0, 0])
                    polygon(points=[
                        [3, 0],
                        [2.5, 0],
                        [0, 2.5],
                        [2.5, 5],
                        [3, 5],
                    ]);
                }
            }
            
            // Locking bumps
            intersection() {
                cylinder(h=5, r=25, $fn=200);

                for (a = [45 : 90 : 335]) {
                    for (o = [-19.2, 19.2]) {
                        rotate([0, 0, a + o])
                        translate([0, 23.4, 0]) {
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
    }
}
            
spoolmount_twist();
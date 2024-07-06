use <spoolmount_a.scad>
use <torus.scad>

module prusa_enclosure_mount(angle) {
    translate([0, 0, 13])
    spoolmount_a();

    rotate([0, 0, angle])
    difference() {
        union() {
            for (yo = [-20, 20]) {
                translate([0, yo, 0])
                difference() {
                    // Side body
                    hull() {
                        for (x = [30, 127]) {
                            for (y = [-7, 7]) {
                                for (z = [2.5, 15.5]) {
                                    translate([x, y, z])
                                    scale([0.7, 0.7, 1.0])
                                    sphere(d=5, $fn=50);
                                }
                            }
                        }
                    }
                    
                    // Through screw hole
                    translate([120, 0, -1])
                    cylinder(h=20, d=3.2, $fn=50);
                    
                    // Hex nut / screw head cutout 
                    translate([120, 0, 18 - (2.6 / 2)])
                    linear_extrude(2.61, center=true)
                    polygon(points=[
                        [-2.8, 1.6175],
                        [0, 3.235],
                        [2.8, 1.6175],
                        [2.8, -1.6175],
                        [0, -3.235],
                        [-2.8, -1.6175],
                    ]);

                    // Underside washer alignment cutouts
                    for (y = [-4, 4]) {
                        translate([124, y, 0])
                        cube([2, 2, 2], center=true);
                    }
                }
            }

            // Center body
            hull() {
                for (x = [30, 115]) {
                    for (y = [-25, 25]) {
                        for (z = [2.5, 15.5]) {
                            translate([x, y, z])
                            scale([0.7, 0.7, 1.0])
                            sphere(d=5, $fn=50);
                        }
                    }
                }
            }

            // Spoolmount support ring
            {
                // Outer core
                difference() {
                    union() {
                        // Top core
                        translate([0, 0, 2.5])
                        cylinder(h=15.5, r=42, $fn=200);

                        // Bottom core
                        cylinder(h=18, r=40.25, $fn=200);
                    }

                    // Center through cutout
                    translate([0, 0, -1])
                    cylinder(h=20, r=25, $fn=200);

                    // Bottom cutout
                    translate([0, 0, -1])
                    cylinder(h=3.5, r=26.75, $fn=200);
                }

                // Outer bottom rounded edge
                translate([0, 0, 2.5])
                torus(r_major=40.25, r_minor=2.5, xs=0.7, $fn=200);

                // Inner bottom rounded edge
                translate([0, 0, 2.5])
                torus(r_major=26.75, r_minor=2.5, xs=0.7, $fn=200);
            }
        }

        // Weight reduction holes rows 1/5
        for (x = [44.5 : 12 : 105]) {
            for (y = [-20 : 40 : 20]) {
                translate([x, y, -1])
                cylinder(h=20, d=9, $fn=50);
            }
        }

        // Weight reduction holes rows 2/4
        for (x = [51 : 12 : 105]) {
            for (y = [-10 : 20 : 10]) {
                translate([x, y, -1])
                cylinder(h=20, d=9, $fn=50);
            }
        }

        // Weight reduction holes row 3
        for (x = [56.5 : 12 : 105]) {
                translate([x, 0, -1])
                cylinder(h=20, d=9, $fn=50);
        }
    }
}

prusa_enclosure_mount(angle=0);
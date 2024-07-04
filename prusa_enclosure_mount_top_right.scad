use <spoolmount_a.scad>

module prusa_enclosure_mount_top_right() {
    spoolmount_a();

    rotate([0, 0, 45])
    difference() {
        union() {
            for (o = [-20, 20]) {
                translate([0, o, 0])
                difference() {
                    // Side body
                    hull() {
                        for (x = [30, 127]) {
                            for (y = [-7, 7]) {
                                translate([x, y, 2.5])
                                scale([0.7, 0.7, 1.0])
                                sphere(d=5, $fn=50);
                            }
                        }
                    }
                    
                    // Through screw hole
                    translate([120, 0, -1])
                    cylinder(h=7, d=3.2, $fn=50);
                    
                    // Hex nut / screw head cutout 
                    translate([120, 0, 3.7])
                    linear_extrude(2.61, center=true)
                    polygon(points=[
                        [-2.8, 1.6175],
                        [0, 3.235],
                        [2.8, 1.6175],
                        [2.8, -1.6175],
                        [0, -3.235],
                        [-2.8, -1.6175],
                    ]);
                }
            }

            // Center body
            hull() {
                for (x = [30, 115]) {
                    for (y = [-25, 25]) {
                        translate([x, y, 2.5])
                        scale([0.7, 0.7, 1.0])
                        sphere(d=5, $fn=50);
                    }
                }
            }
        }
        
        // Weight reduction holes rows 1/3/5
        for (x = [49 : 12 : 105]) {
            for (y = [-20 : 20 : 20]) {
                translate([x, y, -1])
                cylinder(h=7, d=9, $fn=50);
            }
        }
        
        // Weight reduction holes rows 2/4
        for (x = [54.5 : 12 : 105]) {
            for (y = [-10 : 20 : 10]) {
                translate([x, y, -1])
                cylinder(h=7, d=9, $fn=50);
            }
        }
    }
}

prusa_enclosure_mount_top_right();
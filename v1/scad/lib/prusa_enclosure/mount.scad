use <../generic/spoolmount.scad>
use <../util/screw_hole_m3.scad>
use <../util/torus.scad>

module prusa_enclosure_mount(angle, h=10) {
    translate([0, 0, h])
    rotate([180, 0, angle])
    spoolmount(h=h);

    difference() {
        union() {
            for (yo = [-20, 20]) {
                translate([0, yo, 0])
                difference() {
                    // Side body
                    hull() {
                        for (x = [40, 127]) {
                            for (y = [-7, 7]) {
                                for (z = [2.5, h - 2.5]) {
                                    translate([x, y, z])
                                    scale([0.7, 0.7, 1.0])
                                    sphere(d=5, $fn=50);
                                }
                            }
                        }
                    }
                    
                    // Through screw hole
                    translate([120, 0, 0])
                    screw_hole_m3(h=h);

                    // Underside washer alignment cutouts
                    for (y = [-4, 4]) {
                        translate([124, y, 0])
                        cube([2, 2, 2], center=true);
                    }
                }
            }

            // Center body
            hull() {
                for (x = [42, 115]) {
                    for (y = [-25, 25]) {
                        for (z = [2.5, h - 2.5]) {
                            translate([x, y, z])
                            scale([0.7, 0.7, 1.0])
                            sphere(d=5, $fn=50);
                        }
                    }
                }
            }

            // Corner patches
            for (ys = [-1, 1]) {
                hull() {
                    for (z = [2.5, h - 2.5]) {
                        translate([35, ys * 27, z])
                        scale([0.7, 0.7, 1.0])
                        sphere(d=5, $fn=50);

                        translate([40, ys * 27, z])
                        scale([0.7, 0.7, 1.0])
                        sphere(d=5, $fn=50);

                        translate([40, ys * 15, z])
                        scale([0.7, 0.7, 1.0])
                        sphere(d=5, $fn=50);
                    }
                }
            }
        }

        // Weight reduction holes rows 1/5
        for (x = [46.5 : 12 : 107]) {
            for (y = [-20 : 40 : 20]) {
                translate([x, y, -1])
                cylinder(h=h + 2, d=9, $fn=50);
            }
        }

        // Weight reduction holes rows 2/4
        for (x = [53 : 12 : 107]) {
            for (y = [-10 : 20 : 10]) {
                translate([x, y, -1])
                cylinder(h=h + 2, d=9, $fn=50);
            }
        }

        // Weight reduction holes row 3
        for (x = [58.5 : 12 : 107]) {
                translate([x, 0, -1])
                cylinder(h=h + 2, d=9, $fn=50);
        }
    }
}

prusa_enclosure_mount(angle=15);
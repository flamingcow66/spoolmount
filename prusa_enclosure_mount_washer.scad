module prusa_enclosure_mount_washer() {
    difference() {
        // Base
        cube([8.9, 14, 1.5]);

        // Through screw hole
        translate([3.5, 7, -1])
        cylinder(h=3.5, d=3.2, $fn=50);
    }
    
    translate([7.5, 3, 2])
    cube([2, 2, 1], center=true);
    
    translate([7.5, 11, 2])
    cube([2, 2, 1], center=true);
}

prusa_enclosure_mount_washer();
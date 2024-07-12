use <spoolmount.scad>

// SpoolMount removable side (i.e. attached to spool holder or cage)
module spoolmount_b() {
    difference() {
        spoolmount();

        // Holes
        for (a = [0 : 30 : 330]) {
            rotate([0, 0, a])
            translate([29.75, 0, 0]) {
                // Center through hole
                translate([3.25, 0, 3])
                cube([6.5, 8, 7], center=true);
            
                // Diagonal sides
                translate([3.25, 0, 4])
                rotate([45, 0, 0])
                cube([6.5, sqrt(72), sqrt(72)], center=true);

                // Flat top cutout
                translate([3.25, 0, 5])
                cube([6.5, 12, 2], center=true);
            }
        }
    }
}

spoolmount_b();
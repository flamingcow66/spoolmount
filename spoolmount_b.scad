use <torus.scad>

// SpoolMount removable side (i.e. attached to spool holder or cage)
module spoolmount_b() {
    difference() {
        // Ring
        cylinder(h=5, r=42, $fn=200);

        translate([0, 0, -1])
        cylinder(h=7, r=25, $fn=200);
    
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
            
    // Rounded edges
    translate([0, 0, 2.5]) {
        torus(r_major=25, r_minor=2.5, xs=0.7, $fn=200);
        torus(r_major=42, r_minor=2.5, xs=0.7, $fn=200);
    }
}

spoolmount_b();
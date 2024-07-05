use <spoolmount_a.scad>
use <spoolmount_b.scad>
use <torus.scad>

translate([0, 0, 10])
spoolmount_a();

spoolmount_b();

translate([0, 0, 5])
difference() {
    cylinder(h=5, r=42, $fn=500);

    translate([0, 0, -1])
    cylinder(h=7, r=25, $fn=500);
    
    torus(r_major=33.25, r_minor=3.5, ys=1.4, $fn=500);
}
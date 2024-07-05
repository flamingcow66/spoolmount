module torus(r_major, r_minor, xs=1.0, ys=1.0) {
    rotate_extrude()
    translate([r_major, 0, 0])
    scale([xs, ys, 1.0])
    circle(r=r_minor);
}
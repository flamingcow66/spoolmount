use <spoolmount.scad>

// SpoolMount fixed side (i.e. attached to printer or enclosure)
module spoolmount_a() {
    spoolmount();

    // Hooks
    for (x = [-33, 33]) {
        translate([x, 0, 5])
        rotate([0, -90, 0])
        linear_extrude(6, center=true) {
            polygon(points=[
                [0, 0],
                [0, 4],
                [2, 4],
                [4, 6],
                [5, 6],
                [5, 2],
                [3, 0],
                [0, 0],
            ]);

            translate([3, 2])
            circle(r=2, $fn=50);
        }
    }

    // Locking bump
    translate([0, -30.8, 5])
    rotate([0, -90, 0])
    linear_extrude(6, center=true) {
        polygon(points=[
            [0, 0],
            [1.6, -4],
            [1.6, -5],
            [0, -5],
            [0, 0],
        ]);
    }
}

spoolmount_a();
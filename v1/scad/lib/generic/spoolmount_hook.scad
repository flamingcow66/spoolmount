module spoolmount_hook() {
    difference() {
        // Hook body
        linear_extrude(9) {
            polygon(points=[
                [0, 0],
                [0, 12],
                [1, 12],
                [3, 10],
                [7, 10],
                [9, 12],
                [10, 12],
                [10, 8],
                [8, 6],
                [5, 6],
                [5, 2],
                [3, 2],
                [1, 0],
            ]);

            translate([8, 8])
            circle(r=2, $fn=50);
        }

        // Corner cutouts
        {
            translate([9, 10.5, -0.5])
            rotate([90, 0, 90])
            linear_extrude(3, center=true)
            polygon(points=[
                [0, 0],
                [2, 0],
                [2, 2],
            ]);

            translate([9, 10.5, 9.5])
            rotate([-90, 0, 90])
            linear_extrude(3, center=true)
            polygon(points=[
                [0, 0],
                [2, 0],
                [2, 2],
            ]);
        }
    }
}

spoolmount_hook();
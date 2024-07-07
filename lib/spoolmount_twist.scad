module spoolmount_twist() {
    cylinder(h=5, r=23, $fn=200);
    
    for (a = [45 : 90 : 135]) {
        for (o = [-10, 10]) {
            rotate([0, 0, a + o])
            scale([0.2, 1.0, 1.0])
            rotate_extrude($fn=200)
            translate([23, 0, 0])
            _spoolmount_twist_profile();
        }
    }
    
    for (a = [45 : 90 : 335]) {
        rotate([0, 0, a - 10])
        rotate_extrude(angle=20, $fn=200)
        translate([23, 0, 0])
        _spoolmount_twist_profile();
    }

    rotate_extrude($fn=200)
    translate([23, 0, 0])
    polygon(points=[
        [0, 3.75],
        [1.25, 5],
        [0, 5],
    ]);
}

module _spoolmount_twist_profile() {
    polygon(points=[
        [0, 1.25],
        [1.25, 2.5],
        [0, 3.75],
    ]);
    
    polygon(points=[
        [0, 0],
        [1.25, 0],
        [0, 1.25],
    ]);
}

spoolmount_twist();
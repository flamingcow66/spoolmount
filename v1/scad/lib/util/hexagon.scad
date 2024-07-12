module hexagon(inradius) {
    circle(r=2 * inradius / sqrt(3), $fn=6);
}

hexagon(inradius=2.8);
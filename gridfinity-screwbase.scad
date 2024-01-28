include <gridfinity-rebuilt-utility.scad>

/* [Setup Parameters] */
$fa = 4;
$fs = 0.25;

/* [General Settings] */
// number of bases along x-axis
gridx = 1;
// number of bases along y-axis
gridy = 2;
// bin height. See bin height information and "gridz_define" below.
gridz = 6;

gridfinityBase(gridx, gridy, l_grid, 0, 0, 3, only_corners=only_corners);

wall = .06;

t = 2;
r = 6;

difference() {
    color("blue")
    gridfinityInit(gridx, gridy, 7*2, 0);

    union() {
        translate([t,0,0])
        translate([0,-42*wall,0])
        rotate(r,[0,0,1])
        screwdriver(d_head=26,l=160);

        translate([-t,0,0])
        translate([0,-42*(3-wall),0])
        rotate(180+r,[0,0,1])
        screwdriver(d_head=26,l=180);
    };
}


module screwdriver(d_head=26, l=160) {
    translate([0,42,6+15])
    rotate(90, [1,0,0])
    union() {
        color("orange")
        cylinder(h = 45, r = 26/2);
        
        color("red")
        translate([0,0,45-1])
        cylinder(h = 35+1, r = 20/2);
        
        color("white")
        cylinder(h = l, r = 1.5);
    }
}
include <gridfinity-rebuilt-utility.scad>

/* [Setup Parameters] */
$fa = 2;
$fs = 0.25;

/* [General Settings] */
// number of bases along x-axis
gridx = 1;
// number of bases along y-axis
gridy = 1;
// bin height. See bin height information and "gridz_define" below.
gridz = 5;


x = 7;
y = 4.7;

difference() {

    union() {
        gridfinityBase(gridx, gridy, l_grid, 0, 0, 3, only_corners=only_corners);
        color("blue")
        gridfinityInit(gridx, gridy, 7*gridz, 0);
    };
    translate([14,14,0])
    tip();
    translate([-14,14,0])
    tip();
    
    
    //translate([-x,y,0]) tip();
    translate([x,y,0]) tip();
    translate([0,14,0]) tip();
    translate([7,-14,0]) tip();
    
    translate([14,-y,0]) tip();
    
    color("gray")
    translate([-10,-10,0])
    rotate([0,0,180])
    pinecil();
}//*/


//translate([0,42,0])
//pinecil();


module pinecil() {
    h = 7*gridz;
    
    cube_l = 17-14.1/2+.1;
    
    d = 14.3+.1;
    
    translate([0,0,h_base+.5])
    union() {
        translate([-d/2,-cube_l,0])
        scale([d, cube_l, h])
        cube(1);
        
        cylinder(h=h, r=d/2);
        
        translate([0, -cube_l, 0])
        cylinder(h=h, r=5.7/2);
    };
}


module tip() {
    translate([0,0,4.5])
    union() {
        color("red")
        cylinder(h=34.1, r=5.7/2+.1);
        
        color("silver")
        translate([0,0,34])
        cylinder(h=1.6, r=10.7/2+.1);
    };
}
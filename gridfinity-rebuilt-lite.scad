include <gridfinity-rebuilt-utility.scad>

// ===== INFORMATION ===== //
/*
 IMPORTANT: rendering will be better for analyzing the model if fast-csg is enabled. As of writing, this feature is only available in the development builds and not the official release of OpenSCAD, but it makes rendering only take a couple seconds, even for comically large bins. Enable it in Edit > Preferences > Features > fast-csg

https://github.com/kennetek/gridfinity-rebuilt-openscad

*/

// ===== PARAMETERS ===== //

/* [Setup Parameters] */
$fa = 8;
$fs = 0.25;

/* [General Settings] */
// number of bases along x-axis
gridx = 3;  
// number of bases along y-axis   
gridy = 3;  
// bin height. See bin height information and "gridz_define" below.  
gridz = 6;   
// base unit
length = 42;

/* [Compartments] */
// number of X Divisions
divx = 2;
// number of y Divisions
divy = 2;

/* [Toggles] */
// snap gridz height to nearest 7mm increment
enable_zsnap = false;
// enable upper lip for stacking other bins
enable_lip = true;

/* [Other] */
// determine what the variable "gridz" applies to based on your use case
gridz_define = 0; // [0:gridz is the height of bins in units of 7mm increments - Zack's method,1:gridz is the internal height in millimeters, 2:gridz is the overall external height of the bin in millimeters]
// the type of tabs
style_tab = 1; //[0:Full,1:Auto,2:Left,3:Center,4:Right,5:None]

/* [Base] */
style_hole = 0; // [0:no holes, 1:magnet holes only, 2: magnet and screw holes - no printable slit, 3: magnet and screw holes - printable slit]
// number of divisions per 1 unit of base along the X axis. (default 1, only use integers. 0 means automatically guess the right division)
div_base_x = 0;
// number of divisions per 1 unit of base along the Y axis. (default 1, only use integers. 0 means automatically guess the right division)
div_base_y = 0; 


// ===== IMPLEMENTATION ===== //

// Input all the cutter types in here
//color("tomato")
//gridfinityLite(gridx, gridy, gridz, gridz_define, enable_lip, enable_zsnap, length, div_base_x, div_base_y, style_hole) {
//    cutEqual(n_divx = divx, n_divy = divy, style_tab = style_tab, enable_scoop = false);
//}
color("tomato")
gridfinityLite(gridx=3, gridy=3, gridz=5, gridz_define=0, enable_lip=true, enable_zsnap=false, length=42, div_base_x=0, div_base_y=0, style_hole=0) {
    cutEqual(n_divx=1, n_divy=1, style_tab=5, enable_scoop = false);
}

// ===== CONSTRUCTION ===== //


module gridfinityLite(gridx, gridy, gridz, gridz_define, enable_lip, enable_zsnap, length, div_base_x, div_base_y, style_hole) { 
    difference() {
        union() {
            gridfinityInit(gridx, gridy, height(gridz, gridz_define, enable_lip, enable_zsnap), 0, length)
            children();
            gridfinityBase(gridx, gridy, length, div_base_x, div_base_y, style_hole);
        }

        difference() {
            union() {
                intersection() {
                    difference() {
                        gridfinityBase(gridx, gridy, length, div_base_x, div_base_y, style_hole, -d_wall*2, false);
                        translate([-gridx*length/2,-gridy*length/2,2*h_base])
                        cube([gridx*length,gridy*length,1000]);
                    }
                    translate([0,0,-1])
                    rounded_rectangle(gridx*length-0.5005-d_wall*2, gridy*length-0.5005-d_wall*2, 1000, r_f2);
                }
                translate([0,0,h_base+d_clear])
                rounded_rectangle(gridx*length-0.5005-d_wall*2, gridy*length-0.5005-d_wall*2, h_base, r_f2);
            }

            translate([0,0,-4*h_base])
            gridfinityInit(gridx, gridy, height(20,0), 0, length)
            children();
        }

    }
}
include <gridfinity-rebuilt-utility.scad>

/* [Setup Parameters] */
$fa = 8;
$fs = 0.25;

/* [General Settings] */
// number of bases along x-axis
gridx = 1;
// number of bases along y-axis
gridy = 1;
// bin height. See bin height information and "gridz_define" below.
gridz = 6;

gridfinityBase(gridx, gridy, l_grid, 0, 0, 3, only_corners=only_corners);
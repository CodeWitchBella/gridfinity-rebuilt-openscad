include <gridfinity-rebuilt-utility.scad>

/* [Setup Parameters] */
$fa = 2;
$fs = 0.25;

cube([]);

color("red")
magnets();

module magnets() {
    translate([1.7,10.5,0])
    row();

    row();
}

module row() {
translate([17.5, 0,0])
hole();

translate([8.75, 0,0])
hole();

hole();}



module hole() {
    block_base_hole(3);
}

module rotated() {
    rotate([0,0,1])
    translate([5.53,1.67,0])
    rotate([0,0,65])
    scaled();
}

module scaled() {
    scale(5)
    scale(0.96)
    translate([0,-5.87,0])
    scale(1-1/3)
    scale(0.1)
    rotate([0,0,.68])
    translate([-100, -100])
    import("magnetz.svg");
}
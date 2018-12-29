include <bearing_generated.scad>

translate([0,0,7.000000]) rotate([180,0,0]) bearing_outerA();
bearing_outerB();
bearing_cage();
translate([0,0,7.000000]) rotate([180,0,0]) bearing_cage();
bearing_inner(1);
translate([0,0,7.000000]) rotate([180,0,0]) bearing_inner(0);
screwInner();

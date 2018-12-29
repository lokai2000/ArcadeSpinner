include <bearing_generated.scad>


module screwRing(){
  intersection(){
    difference(){
      cylinder(h=60,d=55.5,center=false,$fn=128);
      import ("outerDialScrew.stl");
    }
      cylinder(h=14,d=200,center=false,$fn=128);
  }
}

union(){
  translate([0,0,3.5]) screwInner();
  screwRing();
}

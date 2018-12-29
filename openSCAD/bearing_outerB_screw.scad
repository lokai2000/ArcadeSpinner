include <bearing_generated.scad>


module screwRing(){
  intersection(){
    difference(){
      import ("innerFrameScrew.stl");
      cylinder(h=60,d=89.5,center=false,$fn=128);
    }
      cylinder(h=14,d=200,center=false,$fn=128);
  }
}

union(){
  translate([0,0,3.5]) bearing_outerB();
  screwRing();
}


include <arclib.scad>;

union(){
  difference(){
    union(){
      cylinder(h=12,d=50,center=false,$fn=128);
      cylinder(h=2,d=92,center=false,$fn=128);
    }
    import("outerEncScrew.stl");
    for ( i = [0 : 18 : 360-4] ){
      rotate([0,0,i]) wedge(28, 8, 10, 12);
    }
  }
  for ( i = [0 : 4 : 360-4] ){
    rotate([0,0,i]) wedge(38, 8, 2, 12);
  }
}


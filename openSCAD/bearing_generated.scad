include <slewlib.scad>

module bearing_outerA(){
  intersection(){
    outerBear(73.815000, 7.000000, Rez=128, cageW=2.185000, ballD=4.370000, Tol=0.230000);
    translate([0,0,-3.500000]) import("outerScrewA.stl");
  }
}
module bearing_outerB(){
  module screw(){
    difference(){
      cylinder(h=7.000000, d=90.000000, $fn=128);
      import("outerScrewB.stl");
    }
  }
  union(){
    outerBear(73.815000, 7.000000, Rez=128, cageW=2.185000, ballD=4.370000, Tol=0.230000);
    translate([0,0,3.500000]) screw();
  }
}
module bearing_cageB(){
  cageBearB(73.815000, 7.000000, Rez=128, cageW=2.185000, ballD=4.370000, Tol=0.230000);
}
module bearing_cageA(){
  cageBearA(73.815000, 7.000000, Rez=128, cageW=2.185000, ballD=4.370000, Tol=0.230000);
}
module bearing_inner(IR=0){
  difference(){
    innerBear(73.815000, 7.000000, Rez=128, cageW=2.185000, ballD=4.370000, Tol=0.230000);
    if ( IR==1 ) {
      translate([0,0,-5.250000]) cylinder(h=7.000000, d=61.000000, $fn=128, center=true);
    }
    translate([0,0,-3.500000]) import("innerScrewB.stl");
  }
}
module screwInner(){
  difference(){  
    intersection(){
      union(){
        translate([0,0,-3.500000]) import("innerScrewA.stl");
        translate([0,0,-5.250000]) cylinder(h=7.000000, d=60.500000, $fn=128, center=true);
      }
      translate([0,0,-3.500000]) cylinder(h=14.000000, d=60.500000, $fn=128, center=false);
    }
    translate([0,0,-3.500000]) cylinder(h=14.000000, d=55.000000, $fn=128, center=false);
  }
}

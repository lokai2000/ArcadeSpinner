

module plate(){
  difference(){
    union(){
      cylinder(h=2.5,d1=132,d2=136,center=false,$fn=128);
      cylinder(h=2.5+7,d1=105, d2=100,center=false,$fn=128);
      translate([60,0,0]) cylinder(h=6,d=10,center=false,$fn=32);
      translate([-60,0,0]) cylinder(h=6,d=10,center=false,$fn=32);
      translate([0,60,0]) cylinder(h=6,d=10,center=false,$fn=32);
      translate([0,-60,0]) cylinder(h=6,d=10,center=false,$fn=32);
      translate([60,0,6]) cylinder(h=2.5,d1=10,d2=8,center=false,$fn=32);
      translate([-60,0,6]) cylinder(h=2.5,d1=10,d2=8,center=false,$fn=32);
      translate([0,60,6]) cylinder(h=2.5,d1=10,d2=8,center=false,$fn=32);
      translate([0,-60,6]) cylinder(h=2.5,d1=10,d2=8,center=false,$fn=32);
    }
    translate([0,0,2.5]) import("outerFrameScrew.stl");
    cylinder(h=10,d1=91, d2=84,center=false,$fn=128);
    translate([60,0,0]) cylinder(h=20,d=3.7,center=false,$fn=16);
    translate([60,0,0]) cylinder(h=2.8,d1=6.8,d2=3.7,center=false,$fn=16);
    translate([-60,0,0]) cylinder(h=20,d=3.7,center=false,$fn=16);
    translate([-60,0,0]) cylinder(h=2.8,d1=6.8,d2=3.7,center=false,$fn=16);
    translate([0,60,0]) cylinder(h=20,d=3.7,center=false,$fn=16);
    translate([0,60,0]) cylinder(h=2.8,d1=6.8,d2=3.7,center=false,$fn=16);
    translate([0,-60,0]) cylinder(h=20,d=3.7,center=false,$fn=16);
    translate([0,-60,0]) cylinder(h=2.8,d1=6.8,d2=3.7,center=false,$fn=16);
  }
}

plate();
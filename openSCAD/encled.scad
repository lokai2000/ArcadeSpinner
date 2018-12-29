

//for reference
/*
module channel(){
  difference(){
    cylinder(h=10,d=92,center=false,$fn=128);
    cylinder(h=10,d=76,center=false,$fn=128);
    
  }
}
*/

module led(){
  translate([0,-0.5,-4]) cube([12,1,8]);
  rotate([45,0,0]) translate([3,-2.5,-2.5]) cube([12,5,5]);
}

difference(){
  union(){
    difference(){
      union(){
        cylinder(h=12+3+7+2,d=100,center=false,$fn=128);
        cylinder(h=10,d=93+12,center=false,$fn=128);
      }
      translate([0,0,12+3+2]) import("outerFrameScrew.stl");
      translate([0,0,2]) cylinder(h=12+3+5,d=93,center=false,$fn=128);
    }
      cylinder(h=10,d=75,center=false,$fn=128);
  }
  translate([0,0,-1]) cylinder(h=100,d=75-12,center=false,$fn=128);
  
  //First is offset 0 degrees
  translate([(75-12-8)/2,0,6]) led();
  translate([(93-12+9)/2,0,6]) led();
  //Second has to be offset by 1 degree.  Can add multiples of N*4
  rotate([0,0,4*24+1]) translate([(75-12-8)/2,0,6]) led();
  rotate([0,0,4*24+1]) translate([(93-12+9)/2,0,6]) led();
  //Third has to be offset by 0.5 degree.  Can add multiples of N*4
  rotate([0,0,4*8+0.5]) translate([(75-12-8)/2,0,6]) led();
  rotate([0,0,4*8+0.5]) translate([(93-12+9)/2,0,6]) led();
  //Fourth has to be offset by 1.5 degree.  Can add multiples of N*4
  rotate([0,0,4*16+1.5]) translate([(75-12-8)/2,0,6]) led();
  rotate([0,0,4*16+1.5]) translate([(93-12+9)/2,0,6]) led();
  
}


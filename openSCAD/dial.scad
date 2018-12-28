

module dialknob(){
  intersection(){
    union(){
      cylinder(h=25,d=58,center=false,$fn=128);
      for ( i = [0 : 10 : 360] ){
        rotate([0,0,i]) translate([58/2,0,25/2]) scale([0.3,1,1.05]) rotate([90,0,0]) cylinder(h=3,d=25,center=true,$fn=64);
      }
    }
    cylinder(h=25,d=200,center=false,$fn=128);
  }
}


module dialInterface(){
  union(){
    //3mm for clearance
    //14 for bearing height
    cylinder(h=25+3,d=55,center=false,$fn=128);    
    intersection(){
      cylinder(h=25+3+14,d=55,center=false,$fn=128); 
      import("innerDialScrew.stl");   
    }
  }
}

module encoderInterface(){
  union(){
    //3mm for clearance
    //12 for encoder height
    cylinder(h=25+3+14+3,d=50,center=false,$fn=128);    
    intersection(){
      cylinder(h=25+3+14+3+12,d=50,center=false,$fn=128); 
      import("innerEncScrew.stl");   
    }
  }
}


module dial(){
  difference(){
    union(){
      dialknob();
      dialInterface();
      encoderInterface();
    }
    translate([0,0,1]) import("outerLedScrew.stl");
  }
}

dial();
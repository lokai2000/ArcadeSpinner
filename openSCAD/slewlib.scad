

module subRing(ringD, ballD=6, Tol=0.18, Rez=96)
{
  tBallD = ballD + Tol;

  rotate_extrude(angle = 360, convexity = 10, $fn=Rez)
  translate([(ringD/2.0), 0, 0])
  circle(r=(tBallD/2.0), $fn=32);
}


module innerBear(ringD, baseH, gap=0.5, cageW=3, Tol=0.18, Rez=96, ballD=6){

  innerD1 = ringD - baseH - gap*2 - cageW;
  innerD2 = ringD + baseH - gap*2 - cageW;
    
  difference(){
    cylinder( h=baseH, d1=innerD1, d2=innerD2, center=true, $fn=Rez);
    subRing(ringD, Tol=Tol, Rez=Rez, ballD=ballD);
  }
    
}

module outerBear(ringD, baseH, gap=0.5, cageW=3, Tol=0.18, Rez=96, wall = 6.0, ballD=6){

  outerD1 = ringD - baseH + gap*2 + cageW;
  outerD2 = ringD + baseH + gap*2 + cageW;
    
  difference(){
    cylinder( h=baseH, d=outerD2+wall, center=true, $fn=Rez);
    cylinder( h=baseH, d1=outerD1, d2=outerD2, center=true, $fn=Rez);
    subRing(ringD, Tol=Tol, Rez=Rez, ballD=ballD);
  }  
}


module cageBearCore(ringD, baseH, cageW=3, ballTol=0.18, ballD=6, Rez=96){

  cageID1 = ringD - baseH - cageW;
  cageID2 = ringD + baseH - cageW;

  cageOD1 = ringD - baseH + cageW;
  cageOD2 = ringD + baseH + cageW;
  
  circ = ringD * 3.141592654;
  count = floor(circ/(1.75*ballD));

  stepAng = 360.0/count;

  cal=max(3*ballTol,1.0);
  cBallD = ballD + cal;
      
  difference(){
    cylinder( h=baseH, d1=cageOD1, d2=cageOD2, center=true, $fn=Rez);
    cylinder( h=baseH, d1=cageID1, d2=cageID2, center=true, $fn=Rez);

    for (i=[0:count-1])
      rotate([0,0,i*stepAng]) translate([ringD/2.0,0,0]) rotate([0,-45,0]) cylinder(h=baseH, d=cBallD, center=true, $fn = 32 );

  }
  
}

module cageBearA(ringD, baseH, cageW=3, ballTol=0.18, ballD=6, Rez=96){

  outerD2 = ringD * 2.0;

  intersection(){
    cageBearCore(ringD, baseH, cageW=cageW, ballTol=ballTol, ballD=ballD, Rez=Rez);
    translate([-outerD2, -outerD2, 0]) cube( [outerD2*2, outerD2*2, baseH] );
  }

}

module cageBearB(ringD, baseH, cageW=3, ballTol=0.18, ballD=6, Rez=96){

  outerD2 = ringD * 2.0;

  intersection(){
    cageBearCore(ringD, baseH, cageW=cageW, ballTol=ballTol, ballD=ballD, Rez=Rez);
    translate([-outerD2, -outerD2, -baseH]) cube( [outerD2*2, outerD2*2, baseH] );
  }

}



import screwGenLib
import sys

screwTol = 0.4

#Bearing outer diameter
outerD = 90

#Bearing inner diameter
innerD = 55

#Ball diameter
ballD = 4.37

#Bearing height
bHeight = 7.0

#Ball Tolerance
Tol=0.23

#segement resolution
rez = 128

#Checks and further definitions
if ballD + 2 > bHeight:
  print "Bearing height is short. Height must be a minimum of ball diameter + 2.0."
  sys.exit(1)



cageW = ballD/2.0
gap = 0.5

#The 6.0 is the default wall diameter addition
ringD = outerD - 6.0 -bHeight - gap*2 - cageW 


innerD1 = ringD - bHeight - gap*2 - cageW;
print innerD1

if (innerD1 -innerD) < 6.0:
  print "Inner diamter to large. Max inner diamter is {0:f}.".format(innerD1-6.0)
  sys.exit(1)


#some more math

#screw segment height is ~3mm
screwsegs = (2*bHeight)/3.0

P = 3.0
N = int(screwsegs*2)

#outer wall is 3 mm

R2 = (outerD-2.5)/2.0
R1 = R2 - 1.0
SCREW = screwGenLib.screwDef(R2,R1,P,N,"../openSCAD/outerScrewA.stl")
screwGenLib.buildScrew(SCREW)

R2 += screwTol
R1 += screwTol
SCREW = screwGenLib.screwDef(R2,R1,P,N,"../openSCAD/outerScrewB.stl")
screwGenLib.buildScrew(SCREW)


R2 = (innerD+4.0)/2.0
R1 = R2 - 1.0
SCREW = screwGenLib.screwDef(R2,R1,P,N,"../openSCAD/innerScrewA.stl")
screwGenLib.buildScrew(SCREW)

R2 += screwTol
R1 += screwTol
SCREW = screwGenLib.screwDef(R2,R1,P,N,"../openSCAD/innerScrewB.stl")
screwGenLib.buildScrew(SCREW)

fID = open("../openSCAD/bearing_generated.scad","w")

fID.write("include <slewlib.scad>\n\n")
fID.write("module bearing_outerA(){\n")
fID.write("  intersection(){\n")
fID.write("    outerBear({0:f}, {1:f}, Rez={2:d}, cageW={3:f}, ballD={4:f}, Tol={5:f});\n".format(ringD,bHeight,rez,cageW,ballD,Tol))
fID.write('    translate([0,0,-{0:f}]) import("outerScrewA.stl");\n'.format(bHeight/2.0))
fID.write("  }\n")
fID.write("}\n")



fID.write("module bearing_outerB(){\n")
fID.write("  module screw(){\n")
fID.write("    difference(){\n")
fID.write("      cylinder(h={0:f}, d={1:f}, $fn={2:d});\n".format(bHeight,outerD,rez))
fID.write('      import("outerScrewB.stl");\n')
fID.write("    }\n")
fID.write("  }\n")
fID.write("  union(){\n")
fID.write("    outerBear({0:f}, {1:f}, Rez={2:d}, cageW={3:f}, ballD={4:f}, Tol={5:f});\n".format(ringD,bHeight,rez,cageW, ballD,Tol))
fID.write("    translate([0,0,{0:f}]) screw();\n".format(bHeight/2.0))
fID.write("  }\n")
fID.write("}\n")



fID.write("module bearing_cageB(){\n")
fID.write("  cageBearB({0:f}, {1:f}, Rez={2:d}, cageW={3:f}, ballD={4:f}, Tol={5:f});\n".format(ringD,bHeight,rez,cageW,ballD,Tol))
fID.write("}\n")


fID.write("module bearing_cageA(){\n")
fID.write("  cageBearA({0:f}, {1:f}, Rez={2:d}, cageW={3:f}, ballD={4:f}, Tol={5:f});\n".format(ringD,bHeight,rez,cageW,ballD,Tol))
fID.write("}\n")


fID.write("module bearing_inner(IR=0){\n")
fID.write("  difference(){\n")
fID.write("    innerBear({0:f}, {1:f}, Rez={2:d}, cageW={3:f}, ballD={4:f}, Tol={5:f});\n".format(ringD,bHeight,rez,cageW,ballD,Tol))
fID.write("    if ( IR==1 ) {\n")
fID.write("      translate([0,0,-{0:f}]) cylinder(h={1:f}, d={2:f}, $fn={3:d}, center=true);\n".format(bHeight/2.0+bHeight/4.0,bHeight,innerD+6.0,rez))
fID.write("    }\n")
fID.write('    translate([0,0,-{0:f}]) import("innerScrewB.stl");\n'.format(bHeight/2.0))
fID.write("  }\n")  
fID.write("}\n")


fID.write("module screwInner(){\n")
fID.write("  difference(){  \n")
fID.write("    intersection(){\n")
fID.write("      union(){\n")
fID.write('        translate([0,0,-{0:f}]) import("innerScrewA.stl");\n'.format(bHeight/2.0))
fID.write("        translate([0,0,-{0:f}]) cylinder(h={1:f}, d={2:f}, $fn={3:d}, center=true);\n".format(bHeight/2.0+bHeight/4.0,bHeight,innerD+6.0-0.5,rez))
fID.write("      }\n")
fID.write("      translate([0,0,-{0:f}]) cylinder(h={1:f}, d={2:f}, $fn={3:d}, center=false);\n".format(bHeight/2.0,bHeight*2.0,innerD+6.0-0.5,rez))
fID.write("    }\n")
fID.write("    translate([0,0,-{0:f}]) cylinder(h={1:f}, d={2:f}, $fn={3:d}, center=false);\n".format(bHeight/2.0,bHeight*2.0,innerD,rez))
fID.write("  }\n")
fID.write("}\n")

fID.close()



fID = open("../openSCAD/bearing_complete.scad","w")
fID.write("include <bearing_generated.scad>\n\n")

fID.write("translate([0,0,{0:f}]) rotate([180,0,0]) bearing_outerA();\n".format(bHeight))
fID.write("bearing_outerB();\n")
fID.write("bearing_cage();\n")
fID.write("translate([0,0,{0:f}]) rotate([180,0,0]) bearing_cage();\n".format(bHeight))
fID.write("bearing_inner(1);\n")
fID.write("translate([0,0,{0:f}]) rotate([180,0,0]) bearing_inner(0);\n".format(bHeight))
fID.write("screwInner();\n")
fID.close()


fID = open("../openSCAD/bearing_outerA.scad","w")
fID.write("include <bearing_generated.scad>\n\n")
fID.write("bearing_outerA();\n")
fID.close()

fID = open("../openSCAD/bearing_outerB.scad","w")
fID.write("include <bearing_generated.scad>\n\n")
fID.write("bearing_outerB();\n")
fID.close()

fID = open("../openSCAD/bearing_cageB.scad","w")
fID.write("include <bearing_generated.scad>\n\n")
fID.write("bearing_cageB();\n")
fID.close()

fID = open("../openSCAD/bearing_cageA.scad","w")
fID.write("include <bearing_generated.scad>\n\n")
fID.write("rotate([180,0,0]) bearing_cageA();\n")
fID.close()

fID = open("../openSCAD/bearing_innerA.scad","w")
fID.write("include <bearing_generated.scad>\n\n")
fID.write("rotate([180,0,0]) bearing_inner(1);\n")
fID.close()

fID = open("../openSCAD/bearing_innerB.scad","w")
fID.write("include <bearing_generated.scad>\n\n")
fID.write("rotate([180,0,0]) bearing_inner(0);\n")
fID.close()

fID = open("../openSCAD/bearing_screwInner.scad","w")
fID.write("include <bearing_generated.scad>\n\n")
fID.write("screwInner();\n")
fID.close()


import screwGenLib
import sys

screwTol     = 0.4
targetHeight = 60


#screw segment height is ~3mm
screwsegs = (targetHeight)/3.0

P = 3.0
N = int(screwsegs*2)

#outer wall is 3 mm

#screw sets for attaching dial to bearing
#Shrink diamter so that good seating occurs
R2 = (55.0-2.0)/2.0
R1 = R2 - 1.0
SCREW = screwGenLib.screwDef(R2,R1,P,N,"../openSCAD/outerDialScrew.stl")
screwGenLib.buildScrew(SCREW)

R2 -= screwTol
R1 -= screwTol
SCREW = screwGenLib.screwDef(R2,R1,P,N,"../openSCAD/innerDialScrew.stl")
screwGenLib.buildScrew(SCREW)


#screw sets for attaching encoder to dial
#Shrink diamter so that good seating occurs
R2 = (50.0-2.0)/2.0
R1 = R2 - 1.0
SCREW = screwGenLib.screwDef(R2,R1,P,N,"../openSCAD/outerEncScrew.stl")
screwGenLib.buildScrew(SCREW)

R2 -= screwTol
R1 -= screwTol
SCREW = screwGenLib.screwDef(R2,R1,P,N,"../openSCAD/innerEncScrew.stl")
screwGenLib.buildScrew(SCREW)

#screw sets for attaching assembly to frame
R2 = (95)/2.0
R1 = R2 - 1.0
SCREW = screwGenLib.screwDef(R2,R1,P,N,"../openSCAD/outerFrameScrew.stl")
screwGenLib.buildScrew(SCREW)

R2 -= screwTol
R1 -= screwTol
SCREW = screwGenLib.screwDef(R2,R1,P,N,"../openSCAD/innerFrameScrew.stl")
screwGenLib.buildScrew(SCREW)


'''
#screw sets for possible LED core
R2 = (40)/2.0
R1 = R2 - 1.0
SCREW = screwGenLib.screwDef(R2,R1,P,N,"../openSCAD/outerLedScrew.stl")
screwGenLib.buildScrew(SCREW)

R2 -= screwTol
R1 -= screwTol
SCREW = screwGenLib.screwDef(R2,R1,P,N,"../openSCAD/innerLedScrew.stl")
screwGenLib.buildScrew(SCREW)
'''


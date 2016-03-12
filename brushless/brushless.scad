 //brushless_2804(brushless,fn,screw,smussa,supporto)
 brushless_2804(1,6,1,1,1);



Length=15;
Diametro=34;
canLength=10;
deltaTOP=12;
ScrewTOP=2.2; //M2
XdeltaBOTTOM=16;
YdeltaBOTTOM=19;
ScrewBOTTOM=3.2;//M3
mX=[[0,0,0], [1,0,0]];
mY=[[0,0,0], [0,1,0]];
r=[[0,0,0], [0,0,90]];

module brushless_2804(brushless,fn,screw,smussa,supporto) translate([0,0,-Length+canLength]) {
//color([0.15,0.15,0.15,1])
  difference() {
    union (){
        //brushless
if(brushless==1){        
if(smussa==1){        
        translate([0,0,1])cylinder(h=Length-2,d=Diametro,$fn=fn*Diametro);
        //x smussare TOP
        translate([0,0,Length-1]) cylinder(h=1-.1,d1=Diametro,d2=Diametro-8,$fn=fn*Diametro);
        //x smussare BOTTOM
        translate([0,0,.1]) cylinder(h=1-.1,d2=Diametro,d1=Diametro-6,$fn=fn*Diametro);
}
if(smussa==0){        
        translate([0,0,0.1])cylinder(h=Length-0.2,d=Diametro,$fn=fn*Diametro);
}
}
//supporto
if(supporto==1){
        color ("blue") difference(){
                translate([0,0,-4])cylinder(h=Length+8,d=Diametro+4*2,$fn=fn*Diametro);
            translate([0,0,-.1])cylinder(h=Length+.2,d=Diametro+.2,$fn=fn*Diametro);
            //placca TOP
            for (mX=mX, mY=mY) mirror(mX) mirror(mY) translate([ScrewTOP,ScrewTOP,Length]) cube([(Diametro+4)/2,(Diametro+4)/2,4+.1]);
            //placca BOTTOM
            for (mX=mX, mY=mY) mirror(mX) mirror(mY) translate([ScrewBOTTOM,ScrewBOTTOM,-4-.1]) cube([(Diametro+4)/2,(Diametro+4)/2,4+.1]);
        }
    }
}
    //taglio x rotazione
    translate([0,0,Length-canLength]) cylinder(h=.5,d=Diametro+8+.1,$fn=fn*Diametro);
    //fori top
    for (r=r, mX=mX) rotate(r) mirror(mX)translate([deltaTOP/2,0,Length+.01-3]) cylinder(h=8,d=ScrewTOP,$fn=fn*ScrewTOP);
    //fori bottom
    for (mX=mX) mirror(mX) translate([XdeltaBOTTOM/2,0,3]) rotate([0,180,0])cylinder(h=8,d=ScrewBOTTOM,$fn=fn*ScrewBOTTOM);
    for (mY=mY) mirror(mY) translate([0,YdeltaBOTTOM/2,3]) rotate([0,180,0]) cylinder(h=8,d=ScrewBOTTOM,$fn=fn*ScrewBOTTOM);
}
//mostra screw
if(screw==1) color("gray"){        
    //viti TOP
    for (r=r, mX=mX) rotate(r) mirror(mX){
        translate([deltaTOP/2,0,Length+.01-3]) cylinder(h=8,d=ScrewTOP,$fn=fn*ScrewTOP);
        translate([deltaTOP/2,0,6+Length+.01-3]) cylinder(h=2,d1=ScrewTOP,d2=ScrewTOP+2,$fn=fn*ScrewTOP);
    }
    //viti bottom
    for (mX=mX) mirror(mX) {
        translate([XdeltaBOTTOM/2,0,3]) rotate([0,180,0])cylinder(h=8,d=ScrewBOTTOM,$fn=fn*ScrewBOTTOM);
        translate([XdeltaBOTTOM/2,0,-3]) rotate([0,180,0])cylinder(h=2,d1=ScrewBOTTOM,d2=ScrewBOTTOM+3,$fn=fn*ScrewBOTTOM);
    }
    for (mY=mY) mirror(mY) {
        translate([0,YdeltaBOTTOM/2,3]) rotate([0,180,0]) cylinder(h=8,d=ScrewBOTTOM,$fn=fn*ScrewBOTTOM);
        translate([0,YdeltaBOTTOM/2,-3]) rotate([0,180,0]) cylinder(h=2,d1=ScrewBOTTOM,d2=ScrewBOTTOM+3,$fn=fn*ScrewBOTTOM);
    }
}
}

/*
http://www.hobbyking.com/hobbyking/store/__43040__2804_210Kv_Brushless_Gimbal_Motor_Ideal_for_GoPro_to_Compact_Style_Cameras_.html
Poles:          12N14P
KV(RPM/V):      210
Resistance:      10.4omh
Weight:         35g
Wire:           0.19mm
Torque:         240g
Kv(rpm/v)	    210
Peso (g)	    35
Max Current(A)	0
Resistance(mh)	10
Max Voltage(V)	0
Power(W)	    0
Shaft A (mm)	0
Length B (mm)	15
Diametro C (mm)	34
Can Length (mm)	10
Total Length E (mm)	15

Bottom holes center to center:
    16mm (XdeltaBOTTOM)and
    19mm (YdeltaBOTTOM)
    ScrewTOP=3.2;
    M3 Screw (8mm long): http://amzn.to/1sYfw0p
    
Top holes center to center:
    12mm(deltaTOP)
    ScrewTOP=2.2;
    M2 Screw (6mm long): http://amzn.to/1qn0ldI
*/
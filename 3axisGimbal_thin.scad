use <./brushless/brushless.scad>;
brushless_p=[1,6,1,1,0];
//$fn=180;
gira=[180,0,0];
l_GoPro=38-5;
DIA_GoPro=l_GoPro/2*sqrt(3);
//
spessore=10;
distanza=7;
h=36;
//
r=DIA_GoPro+distanza;
s=spessore+r;
//
r1=s+distanza;
s1=spessore+r1;
//
r2=s1+distanza;
s2=spessore+r2;
//
difference() {
    intersection(){
        color([0.1,0.1,0.1,1]) sphere(DIA_GoPro);
        color([0.1,0.1,0.1,1]) cube([DIA_GoPro*2,DIA_GoPro*2,l_GoPro-0.3], center=true);
    }
    //ingrandisce GoPro del 102%
    scale([1.02,1.02,1.02]) rotate(gira) import("gp4seasson.stl", convexity=3);
    //taglia sfera sotto per permettere ingresso GoPro
    translate([-DIA_GoPro,-DIA_GoPro,h/2-3]) cube([DIA_GoPro*2,DIA_GoPro*2,l_GoPro-1]);
    //foro pulsante REC GoPro
    rotate([0,90,-90]) cylinder(h=DIA_GoPro, d1=0, d2=25);
    translate([r-distanza,0,0]) rotate([90,0,90])  brushless_2804(1,6,1,1,0);

}
//1° braccio
difference() {
    intersection(){
        difference() {
            sphere(s);
            sphere(r);
        }
        union() {
            translate([0,0,-h/2]) cube([s,s,h]);
            translate([0,0,0]) rotate([0,90,0]) cylinder(h=s,d=h);
            translate([0,0,0]) rotate([-90,90,0]) cylinder(h=s,d=h);
        }     
    }
    translate([r-distanza,0,0]) rotate([90,0,90])  brushless_2804(1,6,1,1,0);
    translate([0,r1-distanza,0]) rotate([-90,0,0]) brushless_2804(1,6,1,1,0);
}
//2° braccio
difference() {
    intersection(){
        difference() {
            sphere(s1);
            sphere(r1);
        }
        mirror([1,0,0]) union() {
            translate([0,0,-h/2]) cube([s1,s1,h]);
            translate([0,0,0]) rotate([0,90,0]) cylinder(h=s1,d=h);
            translate([0,0,0]) rotate([-90,90,0]) cylinder(h=s1,d=h);
        }
    }
    translate([0,r1-distanza,0]) rotate([-90,0,0]) brushless_2804(1,6,1,1,0);
    translate([-r2+distanza,0,0]) rotate([0,-90,0]) brushless_2804(1,6,1,1,0);
}
//3° braccio
//difference() {
//    intersection(){
//        difference() {
//            sphere(s2);
//            sphere(r2);
//        }
//        rotate([0,0,90]) mirror([1,0,0]) union() {
//            translate([0,0,-h/2]) cube([s2,s2,h]);
//            translate([0,0,0]) rotate([0,90,0]) cylinder(h=s2,d=h);
//            translate([0,0,0]) rotate([-90,90,0]) cylinder(h=s2,d=h);
//        }
//    }
//    translate([-r2+distanza,0,0]) rotate([0,-90,0]) brushless_2804(1,6,1,1,0);
//
//}

color([0.1,0.1,0.1,0.4]) scale([1.02,1.02,1.02]) rotate(gira) import("gp4seasson.stl", convexity=3);
translate([r-distanza,0,0]) rotate([90,0,90])  brushless_2804(1,6,1,1,0);

translate([0,r1-distanza,0]) rotate([-90,0,0]) brushless_2804(1,6,1,1,0);
    
//translate([-r2+distanza,0,0]) rotate([0,-90,0]) brushless_2804(1,6,1,1,0);

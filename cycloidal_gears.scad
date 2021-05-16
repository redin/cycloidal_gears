$fa = 1;
$fs = 0.4;

tol=0.1;

hd=3;
hoff=22;

module donut(wr = 13.5,td = 5){
    $fa = 0.1;
    $fs = 0.4;
    rotate_extrude(angle=360) {
        translate([wr - td/2, 0])circle(d=td);
    }
}

//shaft
%union(){
    translate([0,0,-3.1])cylinder(d=8,h=27);
    translate([0,4,9])cube([2,2,15], center=true);
}

//cam
rotate([0,0,-360*$t])difference(){
    translate([0,3,8.99])cylinder(d=22-tol,h=15, center=true);
    translate([0,0,-3.1])cylinder(d=8,h=27);
    translate([0,3,6])donut(wr=13);
    translate([0,3,12])donut(wr=13);
    translate([0,13.9,1])cylinder(d=4.75,h=4);
    translate([0,13.9,13.1])cylinder(d=4.75,h=4);
    translate([0,4,9])cube([2,2,16], center=true);
}
    

//base
%translate([0,0,-1])union(){
    translate([0,0,9])difference(){
        translate([0,0,-0.5])cylinder(d=75.3,h=26, center=true);
        cylinder(d=66+tol,h=38.01, center=true);
        translate([0,0,9.5])donut(wr=37);
        translate([0,33,9])cylinder(d=4.75,h=3.6);
    }
    for(i=[0:90:360]){
        rotate([0,0,i])translate([0,38.5,3])cube([2,2,15], center=true);
    }
    difference(){
        translate([0,0,-1])cylinder(d=67,h=7, center=true);
        translate([0,0,-1])cylinder(d=22+tol,h=7.1, center=true);
        
    }
//lobes
    for(i=[0:32.727272:360]){
        rotate([0,0,i])translate([0,32.727272,3])scale([1,1,1])cylinder(d=9.5+tol,h=12.01, center=true);
    }
}

color("lightblue")
rotate([0,0,($t/11)*360])translate([sin(360*$t)*3,cos(360*$t)*3,0])union(){
//1st disc
translate([0,0,6.01])
    difference(){
    cylinder(d=60,h=6, center=true);
    cylinder(d=22+tol,h=6.1, center=true);
    donut(wr=13);
    translate([0,10.75,-3.1])cylinder(d=4.75,h=3.5);
//    rotate([0,0,0])translate([0,hoff,0])cylinder(d=hd+tol,h=6.01, center=true);
//    rotate([0,0,120])translate([0,hoff,0])cylinder(d=hd+tol,h=6.01, center=true);
//    rotate([0,0,240])translate([0,hoff,0])cylinder(d=hd+tol,h=6.01, center=true);
    //lobes
    for(i=[0:36:360]){
        rotate([0,0,i])translate([0,30,0])scale([1.1,1,1])cylinder(d=10+tol,h=6.1, center=true);
    }
}

////2nd disc
translate([0,0,12.01]) 
    difference(){
    cylinder(d=50,h=6, center=true);
    cylinder(d=22+tol,h=6.01, center=true);
    donut(wr=13);
        translate([0,10.75,-0.4])cylinder(d=4.75,h=3.5);
//    rotate([0,0,0])translate([0,hoff,0])cylinder(d=hd+tol,h=6.01, center=true);
//    rotate([0,0,120])translate([0,hoff,0])cylinder(d=hd+tol,h=6.01, center=true);
//    rotate([0,0,240])translate([0,hoff,0])cylinder(d=hd+tol,h=6.01, center=true);
    //lobes
    for(i=[0:40:360]){
        rotate([0,0,i])translate([0,25,0])cylinder(d=10+tol,h=6.01, center=true);
    }
}
}

//top
%rotate([0,0,$t/100*-360])
union(){
    translate([0,0,18.5])difference(){
        cylinder(d=65.99,h=7, center=true);
        cylinder(d=22+tol,h=7.01, center=true);
        donut(wr=37);
        rotate([0,0,10])translate([0,33,1])cylinder(d=4.75,h=3.5);
        for(i=[0:72:360]){
            rotate([0,0,i])translate([0,28,0])cylinder(d=4+tol,h=12.01, center=true);
        }
    }
//lobes
    difference(){
    union(){
        for(i=[0:36:360]){
            rotate([0,0,i])translate([0,28,15])scale([1,1,1])cylinder(d=9.5+tol,h=12, center=true);
        }
    }
    for(i=[0:72:360]){
            rotate([0,0,i])translate([0,28,15])cylinder(d=4+tol,h=12.01, center=true);
        }
    translate([0,0,18.5])donut(wr=37);
    }
}
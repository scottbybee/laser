//super simple tool box dividers
//short ones
//divider(170, 25.4);

//long ones
divider(350,35);

module divider (length, hnw){
//hnw = width and height
    difference(){
        cube([length,hnw,hnw]);
        translate([0,5,5]){cube([length,hnw,hnw]);}
        for (hole = [length/10:length/5:length]) {
            translate([hole,hnw/2,0]){#magnet();}
        }
    }
}

module magnet(){
    cylinder(h=3.1,d=8.2);
    translate([0,0,3]){cylinder(h=8,d=2);}
}


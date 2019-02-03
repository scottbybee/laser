// gear head key holder

//make a gear
// make the teeth
rad=100;
thick=6;
teeth=25; //number of gear teeth
keystones = 5;

//keystone(10);

union(){
difference(){
    cylinder(r=rad, h=thick, $fn=180);
    for (t = [1:teeth]){
        echo (t);
        rotate([0,0,(360/teeth)*t]){
            translate([0,-rad,0]){notch(thick);}
        }
    }
//cut out the "keystones"
    for (k = [1:keystones]){
        echo (k);
        rotate([0,0,((360/keystones)*k)+5]){
            translate([.65*rad,0,0]){rotate([0,0,90]){keystone(thick);}}
        }
    }
}

    for (k = [1:10]){
        rotate([0,0,((360/10)*k)+5]){
            translate([0.85*rad,0,thick*(k%2+1.3)]){rotate([180,0,0]){bolt();}}
        }
    }


    rotate([0,0,-18]){translate([0,0,6]){#text("POOR",size=12);}}
    rotate([0,0,18]){translate([0,0,6]){#text("UGLY",size=12);}}
    rotate([0,0,36]){translate([0,0,6]){#text("BIKER",size=12);}}
}

//this is ugly 'cause I'm rotating the text, not the work piece.
//translate([-80,-12,6]){rotate([0,0,4]){#text("POOR   ",size=12);}}
//translate([-19,-9,6]){rotate([0,0,22]){#text("UGLY",size=12);}}
//translate([4,-4,6]){rotate([0,0,40]){#text("BIKER",size=12);}}




// add a skull and PUBS 
// add hooks for keys

module notch(thick){
    $fn=6;
    cylinder(r=10,h=thick);
}

module keystone(thick){
    $fn=4;
    hull(){
        translate([20,0,0]){cylinder(r=10,h=thick,$fn=36);}
        translate([0,0,0]){cylinder(r=15,h=thick,$fn=36);}
        translate([-20,0,0]){cylinder(r=10,h=thick,$fn=36);}
        translate([0,40,0]){cylinder(r=5,h=thick,$fn=36);}
    }
}

module bolt(){
    union(){
        cylinder(r=3,h=2,$fn=6);
        translate([0,0,2]){cylinder(r=2,h=6,$fn=15);}
    }
}

module decoration(){
    
}

module skull() {
    scale([0.1, 0.1, 0.01]);
    surface(file = "/home/scott/Documents/3dPrinting/scad/skull.png", center = true, invert = true);
    }
    
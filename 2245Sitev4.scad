/*
simplify by making the bullet fly right down the y a
this gives the perspective of holding the gun; a natural view.
*/

$fn=90;
difference(){
sight();
gun();
}


module sight(){
    //the sight is a cylinder and is cut out by the gun
    difference(){            
    translate([0,110,0]){
                    rotate([-90,0,0]){
                cylinder(h=120, d=34);
                    }
            }
    //with the rail merged onto it
            //add rail here
    //and the top cut off to clear fixed sites        
    translate([-20,100,10]){cube([40,200,20]);}
    //then poke a bunch of magnet holes and viola!
            }
}
module gun(){
    union(){
barrel();
frame();
    }
}
module barrel(){
    //model of the barrel
     rotate([-90,0,0]){
         union(){
             cylinder(d=25.3, h=135);
             translate([0,0,135]){cylinder(d=22.7, h=100);}
         }
    }
}

module frame (){
    //module part of the frame
    union(){
        translate([-15,0,-26]){
        cube([30,135,14]);
    }
    translate([-14.20,0,-13.5]){
        rotate([0,45,0]){
            cube([20,135,20]);    
        }
    }
}
}
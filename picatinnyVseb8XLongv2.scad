// sixth prototype of the mount
/*
decided to extend the sleeve that goes around the barrel the length of the mount.
and clean up the code a bit?
*/

$fn=45;

//!sight2();

// now diff them
difference(){
difference(){
   translate([0,35,4]){
        rotate([-90,0,180]){
            //the sight with "block of clay" interface
            sight2();
        }
    }
    //model of the gun
    translate([0,-135,1]){gun();}

}
//shear off the top just over the midpoint
//translate([-0,-39,32]){rotate([-90,0,0]){cylinder(r=12,h=200);}}
translate([-15,-39,32]){cube([30,150,30]);}
//translate([-22,-39,22]){rotate([0,-38,0]){cube([30,150,30]);}}
translate([-9,-39,30]){rotate([0,-50,0]){cube([3,150,3]);}}   
translate([9,-39,30]){rotate([0,-50,0]){cube([3,150,3]);}} 
}



//#showgun(); //toggle to see sight or sight on gun
//end


module showgun(){
    //show on gun
    translate([-0,-135,-0]){
        gun();
    }
}

module gun(){
    translate([0,0,23]){
        rotate([-90,0,0]){
            barrel();
        }
    }
    frame();
}

module barrel(){
 //model of the barrel
 cylinder(d=25.3, h=135);
 translate([0,0,135]){
   cylinder(d=22.7, h=100);
  }
}

module frame (){
    //module part of the frame
    union(){
        translate([-15,0,0]){
        cube([30,135,14]);
    }
    translate([-14.20,0,13.5]){
        rotate([0,45,0]){
            cube([20,135,20]);    
        }
    }
}
}






module sight2(){
   
    difference(){
        union(){
            union(){
               rail(11);
               translate([-7.75,-7,-57.5]){cube([15.5,5,95]);}
            }
            minkowski(){ //smooth the main edges
                $fn=12;
                translate([0,-19,-57.5]){cylinder(h=120, d=30);}
                sphere(r=2);
            }
                    
        }
        //poke the magnet holes
        for (z=[30:-20:-50]) { 
            translate([0,-3.5,z]){
                magnet();
            }
        }
        
        //poke the magnet holes
        for (z=[-50:20:55]) { 
            translate([15,-19,z]){
                rotate([90,90,0]){magnet();}
            }
        }
        //poke the magnet holes
        for (z=[-50:20:55]) { 
            translate([-15,-19,z]){
                rotate([-90,90,0]){magnet();}
            }
        }
    }
}



//personalize
//#translate([-14,82,19,]){rotate([90,-0,-90]){linear_extrude(1){text("Bybee");}}}
//translate([15,52,19]){rotate([90,-0,90]){linear_extrude(2.5){text("Bybee");}}}



module magnet(){
    $fn=24;
    rotate([90,0,0]){
        cylinder(h=20,d=8.2);
        translate([0,0,-8]){
            cylinder(h=8,d=2);
        }
    }
}


module rail(sections) {
	translate(v = [0, 0, -5 * sections - 2.5])
        difference() {
		linear_extrude(height = (10.0076 * (0.5 + sections)))
               railprofile();
            translate([0,-0.6,0])
		union() {
			for (s = [1:sections]) {
				translate(v = [0, 0, s * 10.0076 - 10.0076/2.0])
             linear_extrude(height = 5.334)
                             cutprofile();
			}
		}
	  }
}

module railprofile() {
extra_height = 1.4;
	polygon(points=[[-10.6,0],[-8.4,2.2],[8.4,2.2],[10.6,0],[7.8,-2.8],[7.8,-3.8-extra_height],[-7.8,-3.8-extra_height],[-7.8,-2.8]], paths=[[0,1,2,3,4,5,6,7,0]]);
}

module cutprofile() {
	polygon(points=[[-12, -0.8], [-12, 3], [12, 3], [12, -0.8]], paths=[[0,1,2,3,0]]);
}
    
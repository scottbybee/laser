// sixth prototype of the mount
/*
decided to extend the sleeve that goes around the barrel the length of the mount.
and clean up the code a bit?
*/

$fn=200;

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
    translate([0,-135,1]){
        gun();
    }

}
//shear off the top just over the midpoint
translate([-15,-39,30]){
cube([30,150,30]);
}
}



//showgun(); //toggle to see sight or sight on gun
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
    translate([-14.2,0,0]){
        cube([28.4,135,14]);
    }
    translate([-14.20,0,14]){
        rotate([0,45,0]){
            cube([20,135,20]);    
        }
    }
}

module sight(){
    difference(){
        union(){
            rail(9);
            translate([-8,-14,-47.5]){
                difference(){
                    cube([16,11,80]);
                    translate([8,-2,-20]){
                       cylinder(d=22, h=100);
                    }
                }
            }
            translate([0,-16,-47.5]){
                //cube([28,17,19]);
                cylinder(h=110, d=29);
            }
        }
    //poke the magnet holes
    for (z=[30:-10:-40]) { 
        translate([0,-2.3,z]){
            magnet();
            }
        }
    }
}



module sight2(){
    /* make the rail thicker,
       join with large diameter cylinder,
       poke in the magnet holes
       (externally) merge with gun.
    */
    
    difference(){
        union(){
            union(){
               rail(9);
               translate([-7.75,-7,-47.5]){
                   cube([15.5,5,95]);
               }
            }
            translate([0,-19,-47.5]){
                cylinder(h=110, d=29);
            }
        }
        //poke the magnet holes
        for (z=[30:-10:-40]) { 
            translate([0,-3.5,z]){
                magnet();
            }
        }
    }
}

module sight2Backup(){
    /* make the rail thicker,
       join with large diameter cylinder,
       poke in the magnet holes
       (externally) merge with gun.
    */
    
    difference(){
        union(){
            union(){
               rail(9);
               translate([-7.75,-7,-47.5]){
                   cube([15.5,5,95]);
               }
            }
            translate([0,-19,-47.5]){
                cylinder(h=110, d=29);
            }
        }
        //poke the magnet holes
        for (z=[30:-10:-40]) { 
            translate([0,-3.5,z]){
                magnet();
            }
        }
    }
}

//personalize
//#translate([-14,82,19,]){rotate([90,-0,-90]){linear_extrude(1){text("Bybee");}}}
translate([12.75,43,19,]){rotate([90,-0,90]){linear_extrude(2){text("Bybee");}}}



module magnet(){
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
    
// fifth prototype of the mount
/*fixed flaw in gun model, barrel was too low in frame; raised it 3 mm
*/

$fn=200;

// now diff them
difference(){
difference(){
   translate([0,35,7]){
        rotate([-90,0,180]){
            //the sight with "block of clay" interface
            sight();
        }
    }
    //model of the gun
    translate([0,-135,0]){
        gun();
    }

}
translate([-15,-39,27]){
cube([30,50,30]);
}
}

//end

//show on gun
//translate([-0,-135,-0]){
//gun();
//}


module gun(){
    translate([0,0,23]){
        rotate([-90,0,0]){
            barrel();
        }
    }
    frame();
}

module barrel(){
 cylinder(d=25.3, h=135);
 translate([0,0,135]){
   cylinder(d=22.7, h=100);
  }
}

module frame (){
    translate([-14.2,0,0]){
        cube([28.4,135,14]);
    }
    translate([-14.20,0,14]){
        rotate([0,45,0]){
            //cube([28.4,100,28.44]);
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
                    #cube([16,11,80]);
                    translate([8,-2,-20]){
                       cylinder(d=22, h=100);
                    }
                }
            }
            //difference(){
            //translate([-14,-20,33]){
            translate([0,-16,25]){
                //cube([28,17,19]);
                cylinder(h=39, d=29);
            }
                //translate([-14.5,-9,40]){
                    //cube([29,17,19]);
                //}
            //}
        }
//poke the magnet holes
for (z=[20:-10:-40]) { 
    translate([0,-2.3,z]){
        magnet();
    }
}



}

}

module magnet(){
    rotate([90,0,0]){
        cylinder(h=4.2,d=8.2);
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
    
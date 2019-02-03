//new piece
$fn=22;

/*//union(){
    difference(){
        hull(){
            rotate([0,90,90]){coin();}
            hull(){
                translate([11,100,0]){rotate([0,90,90]){coin();}}
                translate([-11,100,0]){rotate([0,90,90]){coin();}}
            }
        }
        union(){
        translate([0,50,0]){rotate([0,90,90]){cylinder(d=7, d2=12, h=101, center=true);}}
       for(y=[50:10:90]){
            //todo: rotate the vents to the front like 30 degrees??
            translate([-25,y,0]){rotate([90,0,90]){cylinder(h=50, d=4);}}
        }
        }

    }

translate([0,0,-5]){baffle();}

//} */

difference(){
    shell();
scale([.9,.9,.9]){shell();}
}
translate([0,0,-5]){baffle();}


module coin(){
    cylinder(d=22.7, h=1, center=true);
}
module baffle() {
    //creates an inner structure
    difference(){
        translate([-6,0,-5]){cube([12,100,20]);}
        translate([0,50,5]){rotate([0,90,90]){cylinder(d=7, d2=9, h=101, center=true);}}
        for(y=[10:10:40]){
            translate([-25,y,5]){rotate([90,0,90]){cylinder(h=50, d=4);}}
        }
            for(y=[5:10:50]){
            translate([-10,y,-5]){rotate([45,0,90]){cylinder(h=50, d=4);}}
        }
             for(y=[5:10:50]){
            translate([10,y,-5]){rotate([-45,0,90]){cylinder(h=50, d=4);}}
        }
    }
}

module shell(){
        difference(){
        hull(){
            rotate([0,90,90]){coin();}
            hull(){
                translate([11,100,0]){rotate([0,90,90]){coin();}}
                translate([-11,100,0]){rotate([0,90,90]){coin();}}
            }
        }
        union(){
            translate([0,50,0]){rotate([0,90,90]){cylinder(d=7, d2=12, h=101, center=true);}}
            for(y=[50:10:90]){
                //todo: rotate the vents to the front like 30 degrees??
                translate([-25,y,0]){rotate([90,0,90]){cylinder(h=50, d=4);}}
            }   
        }

    }
    
}
    
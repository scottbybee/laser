$fn=45;
difference(){
    minkowski(){
        difference(){
            cylinder(d=1.22*25.4, h=5.4*25.4,$fn=12); //barrel
            translate([-20,11,-5]){cube([40,40,200]);} //lopp off the top
            translate([-20,-40,0]){cube([40,40,40]);} //lopp off the top
        }
        sphere(r=3);
    }
    
    translate([0,00,-10]){#cylinder(d=1.22*25.4, h=6*25.4, $fn=36);}
}

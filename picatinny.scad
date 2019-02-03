/*
 This was originally:

 Picatinny rail for G36 airsoft gun
 By Stuart Livings, Matthew Roberts. (C) 2010

 This work is free software; you can redistribute it and/or modify it under
 the terms of the GNU General Public License as published by the Free Software
 Foundation; version 2.

 This work is distributed in the hope that it will be useful, but WITHOUT ANY
 WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 A PARTICULAR PURPOSE. See the version 2 of the GNU General Public License for
 more details.


Only the spacing has been tweaked. The center-to-center distance between gaps
in the rail should be 0.394 inches, or 10.0076 mm. The gap itself should be
0.206 inches; with a tolerance of -0.000" +0.008". To ensure any ridges from
printing don't try and make that go negative, I've set the gap to be 0.210 inches.
 */

rail(10);

module rail(sections) {
	translate(v = [0, 0, -5 * sections - 2.5])
        difference() {
		linear_extrude(height = (10.0076 * (0.5 + sections)))
               railprofile();
            translate([0,-0.6,0])
		union() {
			for (s = [1:sections]) {
				translate(v = [0, 0, s * 10.0076 - 10.0076/2.0])
                           #linear_extrude(height = 5.334)
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


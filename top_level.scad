
module second_level() {
	cylinder(h=0.5,r=7.85); // 8cm radius, 0.5 height
	board_holder();
}

module board_holder() {
	board_size = 7;
	border_size = 0.2;
	translate([-board_size/2-border_size,-board_size/2-border_size,0]) difference() {
		cube([board_size+border_size*2,board_size+border_size*2,1]);
		translate([border_size, border_size, 0]) cube([board_size, board_size, 1]);
	}
}

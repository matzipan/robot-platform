//@TODO Implement variables pretty much everywhere.
$fn = 30;

include <wheel.scad>;

base();
translate([0,0,4]) second_level();
translate([0, 9,0]) rotate([0,-90,90])wheel();
translate([0, -9,0]) rotate([0,-90,-90])wheel();



//Robot base
module base() {
	translate([0,0,-0.5])
		cylinder(h=0.5,r=8); // 8cm radius, 0.5 height

	translate([5, 0,-0.5])  ball_caster_mount_point();
	rotate([0,0,180]) translate([5, 0,-0.5]) ball_caster_mount_point();

	translate([0,4.975,0]) engine_assembly();
	rotate([0,0,180]) translate([0,4.975,0]) engine_assembly();

	rotate([0,0,45]) translate([7.5,0,0]) second_layer_support();
	rotate([0,0,135]) translate([7.5,0,0]) second_layer_support();
	rotate([0,0,225]) translate([7.5,0,0]) second_layer_support();
	rotate([0,0,315]) translate([7.5,0,0]) second_layer_support();

	translate([6,0,0]) sensor_support();
	rotate([0,0,180]) translate([6,0,0]) sensor_support();

	translate([0.5, -2.9,0]) battery_box();

	translate([-3.6, -2.9,0]) battery_box();
	
}

module second_level() {
	cylinder(h=0.5,r=7.85); // 8cm radius, 0.5 height

}



//Ball caster mount point hole. 
//@TODO: get exact measurements of the mount points
module ball_caster_mount_point() {
	translate([0,0,-1]) difference() {
		cylinder(h=1, r=0.8);

		cylinder(h=1, r=0.7);
	}
}

//Wheel support semicircle 
//@TODO: make room for wheel rotary encoder
module wheel_support() {
	rotate([-90,0,0]) difference() {
		cylinder(h=0.3, r=1.5);
		translate([-1.5,0,0]) cube(3, 1, 0.3);
		translate([0,-0.5,0]) cylinder(h=0.3, r=0.2); // translate 0.2 (to bring to edge) and 0.3 (motor axis offset) 
	}

}

//Box with a size big enough to fit the motors
//@TODO: Allow for variations
module motor_mount() {
	difference() {
		cube([1.3,2.525,1]);
		translate([0.05, 0.05, 0]) cube([1.2,2.475,1]);
	}	
}

module engine_assembly() {
	translate([0,2.525, 0]) wheel_support();
	translate([-0.65,0,0]) motor_mount();
}

module second_layer_support() {
	difference() {
		cube([0.5,0.5,5]);
		
		translate([0,0,4]) cube([0.3,0.5,0.5]);
		translate([0,0,4.5]) rotate([0,-45,0]) cube([1,1,1]);
		translate([0,0,4.5]) cube([0.1,1,1]);

	}
}

//support for front/back sensors
//@TODO get the right dimensions for this
module sensor_support() {
	translate([0, -2,0]) 	difference() {
		cube([2,4,2]);
		translate([0.4,0.2,0.4]) cube([1.4,3.6,1.7]);
		translate([1.6,0.2,0.7]) cube([0.4,3.6,1.6]);
		translate([0,1,1.5]) rotate([0,90,0]) cylinder(r=0.2, h=0.4); //place for sensor screws? 
		translate([0,3,1.5]) rotate([0,90,0]) cylinder(r=0.2, h=0.4); //place for sensor screws?
	}
}

//support for left/right sensors
//@TODO:implement
module side_sensor_support() {

}


module battery_box() {
	difference() {
		cube([3.1, 5.8, 0.5]);

		translate([0.2, 0.2, 0]) cube([2.7, 5.4, 0.5]);
	}
}
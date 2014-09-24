use <MCAD/gears/involute_gears.scad>
include <MCAD/units/metric.scad>
include <MCAD/units/us.scad>

teeth = 14;
bore_d = length_in (1/4);
outside_d = length_in (0.67);
pitch_d = length_in (0.58);
face = length_in (1/4);
pitch = 24;
hub_d = length_in (0.75);
overall_length = length_in (1/2); // ??
pressure_angle = 20;

$fs = 0.1;
$fa = 1;

difference () {
    gear (
        circular_pitch = convertcp (pitch_d * PI / teeth),
        helix_angle = pitch,
        bore_diameter = bore_d,
        hub_diameter = hub_d,
        hub_thickness = overall_length,
        rim_thickness = face,
        gear_thickness = face,
        pressure_angle = pressure_angle,
        backlash = 0,
        clearance = 0
    );

    translate ([0, 0, -epsilon])
    difference () {
        cylinder (
            d = outside_d + 10,
            h = face + epsilon
        );

        cylinder (
            d = outside_d,
            h = face + epsilon
        );
    }
}

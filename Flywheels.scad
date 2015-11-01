//Stryfe Flywheel Model
//(c) Diaries of a Nerf Armourer - available under license CC-BY 4.0 International. See repo for full details.
//nerfarmourer.tumblr.com

//Flywheel parameters - all in mm
FLYWHEEL_BOTTOM_DIA = 33.5;
FLYWHEEL_UPPER_DIA = 33;
FLYWHEEL_HEIGHT = 13.8;

FLYWHEEL_WALL_THICKNESS = 1;
FLYWHEEL_INTERNAL_DEPTH = 12.5; //Depth from the bottom of the flywheel to the 'roof' on the inside

//Push fit parameters for factory cloned flywheels
PUSH_FIT_SHAFT_DIA = 4.5;
PUSH_FIT_SHAFT_HEIGHT = 7;
PUSH_FIT_SHAFT_WIDTH = 1.7;

//Motor Dimensions
MOTOR_SHAFT_DIA = 2;

$fn = 128; //Set to hi-res render, comment out for testing/speed

module StryfeFlywheel()
{
    //Code to produce basic flywheel without cutouts or shaft mounts
    
    difference()
    {     
        cylinder(d1 = FLYWHEEL_BOTTOM_DIA, d2 = FLYWHEEL_UPPER_DIA, h = FLYWHEEL_HEIGHT);
        
        cylinder(d1 = FLYWHEEL_BOTTOM_DIA - FLYWHEEL_WALL_THICKNESS , d2 = FLYWHEEL_UPPER_DIA, h = FLYWHEEL_INTERNAL_DEPTH);
    }
}

module PushFitFlywheel()
{
    //Code to replicate basic Stryfe flywheels as per factory output
    difference()
    {  
        union()
        {
            //Combine flywheel geometry with shaft positive geometry
             StryfeFlywheel();
            
            translate([0, 0, FLYWHEEL_HEIGHT])
            {
                cylinder(d = PUSH_FIT_SHAFT_DIA, h = PUSH_FIT_SHAFT_HEIGHT);
            }
        }
        
        //Subract the flywheel shaft to produce motor shaft mounting
        cylinder(d = PUSH_FIT_SHAFT_WIDTH, h = PUSH_FIT_SHAFT_HEIGHT + FLYWHEEL_HEIGHT);
    }
}

PushFitFlywheel();

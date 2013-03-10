Processing Experiments
========

A collection of experiments using Processing centered around 3D motion, body interaction, and modeling physics.

Static Math
----------

Base Planet class and Orbiting Planets (extending) that orbit based on static math, not modeling force.

Simple interaction allows the user to place new stationary planets anywhere (mouse click), and also add orbiting bodies (key press). At this point, the orbiting bodies are assigned to orbit any other currently existing body, at random.

Static planets are randomly colored, orbiters randomly greyscaled. Hold down a key for a while to test your rendering ability =P

Challenges:
- User planet placement puts planets at the mouse on the 2D X/Y plane, but only a static Z value. Need to figure out how a user would place something closer/further.


Box Force
----------

Trying to build a broader more extensible framework here. General Body and Container classes. This example begins to model forces, rather than using static variables to directly dictate motion. 

Containers only have bounds and basic display attributes.

Bodies have mass, acceleration, and velocity (density is conceptually fixed). I've also placed methods in this class to deal with whether the body is inside a particular container, and what that does - e.g. wall bouncing, accelerating or decelerating.

Also experimented with acceleration being random or using Perlin noise.

Note: hint(DISABLE_DEPTH_TEST) is required to be able to see the bodies through transparent sides of the containers.

Challenges:
- I'm looking to refactor this to be more functional. Ideally passing objects into an encompassing Physics class that deals with all the interaction.
- While the user can move the camera around to a limited extent, I would like to be able to rotate all the way around the object. There doesn't seem to be a straightforward way to do this - looking into some options that people have written.

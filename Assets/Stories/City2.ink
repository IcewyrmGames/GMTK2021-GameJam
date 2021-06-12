=== City2 ===

// STITCHES:
//
// entrance
// city2_complete

s: You make your way to city 2.
-> Entrance

= Entrance

s: Has: Metallurgical-grade coal
s: Needs: Earth Snacks
s: In a low mountainous area. Has access to coal.

* n: Convince them by reassuring them there will be easy trade with city 1.

s: Indicates city 3 is near higher mountains.
s: Indicates city 4 is down near arable farmlands.

-> CompleteCity

= CompleteCity
~ City2Complete = true

-> END
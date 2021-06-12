=== City4 ===

// STITCHES:
//
// entrance
// city2_complete

s: You make your way to city 4.
-> Entrance

= Entrance

s: City 4
s: Has: Arable Farmlands
s: Needs: Steel
s: In some lower, arable meadowlands
s: Wants to create an industrial food production setup, but needs steel to create the machinery for it.

* p: Convince them by indicating they'll have access to the steel from city 3.
-> CompleteCity

= CompleteCity

n: "We are now convinced!"
s: You have completed city 4. 
~ City4Complete = true

-> END
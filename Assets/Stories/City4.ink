-> City4
=== City4 ===
~ temp cityName = "Whispering Seeds" 
~ temp leader = "Elvira"
s: You make your way to city 4. A dirt path brings you through wide fields, with occasional plots of crop. The crops are droopy, but brightly colored. 
n: "Oh. You have arrived."
* p: "Oh, were you expecting me?"
-- n: "Expecting you? No, I am just noting your arrival. <>
* p: "Hello there!"
-- n: "Hi. <>
- n: <> What are you?"

n: "Welcome to the {cityName}, where the plants whisper to us their needs."

// STITCHES:
//
// entrance
// city2_complete


-> Entrance

= Entrance

//s: City 4
//s: Has: Arable Farmlands
//s: Needs: Steel
//s: In some lower, arable meadowlands
//s: Wants to create an industrial food production setup, but needs steel to create the machinery for it.

* p: Convince them by indicating they'll have access to the steel from city 3.

-> CompleteCity

= CompleteCity

n: "We are now convinced!"
s: You have completed city 4. 
~ City4Complete = true

-> END
//City leader: pompous rich person. Doesn't care about the people outside her settlement, just what she can get for her own
//Leader Name: Dellorithy
//City Name: New Bridginggale

VAR City5BadExits = 0

=== City5 ===
n: Ah, it seems we have a visitor on our doorstep. Is there something we can do for you?
n: {City5 == 1: The name's Dellorithy, sweety. Welcome to the wonderful little village of Bridginggale.|So nice to see you again here in Brigdinggale.}
n: {~We have bathhouses to wash off all that... I hope it's dirt.|If you're looking for a dentist, there may be one a few settlements over.|Are those what pass as shoes nowaways? One of our cobblers may have an opening.|Those tatters are an interesting fashion choice, or is that some kind of political statement?}
~ City5Visit = true
-> MainQuestions

= MainQuestions
<>
	* {!RepresentativeIntro} p: I represent Trailways Railways and Tradeways[.], madame.
		-> RepresentativeIntro
	+ {RepresentativeIntro} p: Just checking back in with you[.], madame.
		-> RepresentativeConvince
	* p: This place seems different from the other settlements nearby[.], why is that?
		-> Class
	* p: What are all these robots everywhere?
		-> Robots
	+ p: I think I should be going.
		-> Exit

= Exit
n: Well, ta-ta for now{City5BadExits < 2:, safe travels!|.}
-> END

= BadExit
n: Hmph, well I never. Come back when you're ready to behave in a more civilized manner.
~ City5BadExits++
-> END

= RepresentativeIntro
n: Oh, that little operation? I heard there was something like that going around. I think it's cute for people to try and band together.
	* p: You don't sound like you want to join.
	* p: Yes, we're trying to build a trade network in the area.
- -> END

= RepresentativeConvince
n: Oh yes, still out here trying to join up the settlements, are you? I'm sorry, but we're still not interested.
	* p: What if I could help with the river?
		-> RiverOffer
	* p: {RiverOffer} I'll help with the river.
	+ p: Okay, nevermind.
- -> END

= RiverOffer
-> END

= Class
n: Well, you could say that the people here have a little more... Oh, what's the word... Ah, that's it, "class".
n: We don't get our hands dirty with mundane work, we have plenty of machines to do all that.
n: It allows us a life of luxury and style. Something that can be all too hard to come by nowadays.
	* p: That seems rather nice.
		->MainQuestions
	* p: That seems rather lazy.
		-> BadExit

= Robots
n: Oh, you mean the helpers? Yes, those little bots do all the manual labor around here.
	* p: So nobody does any work?
		-> PeopleWork
	* p: That seems pretty sensible.
- -> END

= PeopleWork
n: Hmph, well I wouldn't put it that way. We occasionally need to give the auto-repair units a little jiggle.
n: We also direct them around, telling them what to do and where to go.
n: It's much better than walking around in the muck and mud all day, unlike those simpletons in Mudwood.
	* {City6Visit} p: What do you know about Mudwood?
	* {City6Visit} p: You have a problem with Mudwood?
	* {!City6Visit} p: What's Mudwood?
	* {!City6Visit} p: Simpletons? Who are you talking about?
- -> END

= MudwoodIntro
n: Oh, it's a tiny little group of buildings on the other side of the river.
n: The people there are a little more... rough around the edges, if you catch my meaning.
n: We don't mix with them when we can avoid it, though they can be a nuisance when they try to dredge the river.
	* p: Why would they dredge the river?
	* p: Why are they such a nuisance?
- n: Oh, those simpletons have it in their mind that all the gold veins around the river belong to them.
n: We clearly laid claim to it, but nearly every day we find they've run off our helpers that are trying to mine the gold.
	* p: How did you lay claim to it?
	* p: Why do they think it belongs to them?
n: Well, we established our glorious settlment 5 years ago, and when we did we marked off the whole area with mauve ribbons.
n: The people of Mudwood had clearly never seen something as advanced as a flare before, and totally ignored the boundary.
n: They've continued to tresspass into our lands over and over again, and we keep reminding them that we own it.
~ City5Conflict = true
	* {City6Conflict} p: [You used purple ribbons?] Mauve? Do you mean purple ribbons?
	* {City6Conflict} p: That story sounds... oddly familiar.
- -> END

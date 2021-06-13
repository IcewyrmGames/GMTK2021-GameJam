//City leader: pompous rich person. Doesn't care about the people outside her settlement, just what she can get for her own
//Leader Name: Dellorithy
//City Name: New Bridginggale

VAR City5BadExits = 0

=== City5 ===
n: Ah, it seems we have a visitor on our doorstep. Is there something we can do for you?
n: {City5 == 1: The name's Dellorithy, sweety. Welcome to the wonderful little village of Bridginggale.|{City5BadExits < 2 && !City6Complete:So nice to see you again here in Bridginggale.|How nice of you to grace us with your presence.}}
n: {~We have bathhouses to wash off all that... I hope it's dirt.|If you're looking for a dentist, there may be one a few settlements over.|Are those what pass as shoes nowaways? One of our cobblers may have an opening.|Those tatters are an interesting fashion choice, or is that some kind of political statement?}
~ City5Visit = true
-> MainQuestions

= MainQuestions
	* {!City6Complete} p: I represent Trailways Railways and Tradeways[.], madame.
		-> RepresentativeIntro
	* {City6Complete && !RepresentativeIntro} p: I represent Trailways Railways and Tradeways[.], madame.
		-> HostileRepresentativeIntro
	+ {!City6Complete && RepresentativeIntro} p: I wanted to check back in with you[.], madame.
		-> RepresentativeConvince
	+ {City6Complete && (RepresentativeIntro || HostileRepresentativeIntro)} p: I wanted to check back in with you[.], madame.
		-> HostileRepresentativeConvince
	* p: This place seems different from the other settlements nearby[.], why is that?
		-> Class
	* {!City6Complete} p: What are all these robots everywhere?
		-> Robots
	* {City6Complete && !Robots} p: What are all these robots everywhere?
		-> HostileRobots
	* {City6Visit && City5Conflict} p: Dan in Mudwood said you have great taste[.], he thinks you are very fashionable.
		-> DanFlustered
	+ p: I think I should be going.
	  n: Well, ta-ta for now{City5BadExits < 2 && !City6Complete:, safe travels!|.}
		-> END

= BadExit
n: Hmph, well I never. Come back when you're ready to behave in a more civilized manner.
~ City5BadExits++
-> END

= RepresentativeIntro
n: Oh, that little operation? I heard there was something like that going around. I think it's cute for people to try and band together.
	* p: You don't sound like you want to join.
	* p: We're trying to build a trade network in the area.
- n: New Bridginggale has no need of trade with all these other little settlements nearby. No doubt they would be jumping to trade with us, though.
	* p: You don't need anything?
	* p: Why would they be jumping to trade with you?
- n: We have gold, darling. We mine it from the lands down by the river. That gold allows us to trade off-world for everything that we need.
n: That's how we sustain ourselves here. For the five years since we arrived and started mining the gold.
n: You're welcome to pass by, but if you're thinking we'll join your network, I'm afraid you'll be disappointed.
-> MainQuestions

= HostileRepresentativeIntro
n: Oh, that little operation? I heard there was something like that going around.
n: I also heard that your little network is backing Mudwood's claim to the lands around the river. That land rightfully belongs to us.
n: The gold from that river was what sustained our way of life here. You've ruined us, we'll be starving within a year.
	* p: I'm sorry about that[.], I didn't mean to hurt anyone.
	* p: I thought it was the right thing to do[.], I had no idea it would hurt you so much.
- n: Well you should have thought more about your actions. How are we going to pay for the basic necessities around here without that gold?
-> HostileRepresentativeConvince

= RepresentativeConvince
n: Oh yes, still out here trying to join up the settlements, are you? I'm sorry, but we're still not interested.
	* {City5Conflict} p: What if I could help with the river?
		-> RiverOffer
	* {RiverOffer} p: The company will help you with the river.
		-> RiverOfferConfirm
	+ p: Are you sure you don't want to join?
	  n: I am quite sure, I assure you. We have no need for this rail network. Now if you'll excuse me, I have other matters to attend to.
	  ~ City5BadExits++
		-> END
	+ p: Okay, nevermind.
		-> MainQuestions

= HostileRepresentativeConvince
n: Since you've decided to help prevent us from accessing the river, I don't think there's anything else we have to talk about.
	* {City4Complete} What if you had a supply of cheap food?
		-> FoodOffer
	+ {!City4Complete} I'd like to help, but I'm not sure how.
	  n: Well, when you figure out how to right your mistake, then you can come and let us know.
		-> END
	+ I'm sorry, I'll leave you alone.
	  n: Please do.
		-> END

= FoodOffer
n: Cheap food? How dare you even offer. Our food here is imported from old Earth. We have real meat and rare delicacies every day.
	* p: Isn't it better than starving?
	* p: You can't sustain that way of life.
- n: I can't believe I'm even entertaining this, but I suppose you have a point.
n: You're saying that there is a supply of cheap food in your rail network?
	* p: You'll be able to trade with [nearby farms.]the farms in <City4>.
	* p: There's a lot of places to trade with nearby[.], like <City4>.
- n: I did hear that they were recently able to step up to a large-scale farming operation...
n: Grains and vegetables they have, I'm sure, but we would be lacking in caviar and ostrich...
n: Very well, I suppose if it's a matter of life or death we need to trade more freely with nearby cities.
	* p: You won't regret joining!
	* p: We're happen to have you on board.
- n: I can only hope that one day I feel the same.
~ City5Complete = true
-> END

= RiverOffer
n: Oh? What do you have in mind?
	* p: The rail network has influence.[] If you're part of the network, others would legitimize your claim.
	* p: You would have allies.[] If you're part of the network, others would legitimize your claim.
- n: Now, that's an interesting idea. If we had allies to back our claim, those mud-dwellers wouldn't have a leg to stand on.
n: It's something I admit I had not considered. I suppose you have more to offer than I realized at first...
n: Alright, if you can give us your word that others would back us up against the Mudwooders, we'll join your rail network.
	* p: You have my word.
		-> RiverOfferConfirm
	* p: Perhaps I was a bit hasty[.], I can't give you my word at this time.
	  n: I suppose you need to get some things in order before committing... very well.
	  n: When you're ready to talk further, you know where to find me.
		-> MainQuestions

= RiverOfferConfirm
n: Wonderful! In that case, I am happy to have New Bridginggale join your little rail project.
n: Once we have full control over the gold in the river, I'm sure we'll be able to trade it with some of the others for the trinkets they make.
n: No doubt they'll be grateful just to have contact with a place like New Bridginggale.
~ City5Complete = true
-> END

= Class
n: Well, you could say that the people here have a little more... Oh, what's the word... Ah, that's it, "class".
n: We don't get our hands dirty with mundane work, we have plenty of machines to do all that.
n: It allows us a life of luxury and style. Something that can be all too hard to come by nowadays.
	* p: That seems rather nice.
	  n: Thank you, I'm glad to meet someone who can appreciate the high life.
		-> MainQuestions
	* p: That seems rather lazy.
		-> BadExit

= Robots
n: Oh, you mean the helpers? Yes, those little bots do all the manual labor around here.
	* p: So nobody does any work?
	  n: Hmph, well I wouldn't put it that way. We occasionally need to give the auto-repair units a little jiggle.
	  n: We also direct them around, telling them what to do and where to go.
	* p: That seems pretty sensible.
	  n: Yes, I'm glad to meet someone who can appreciate what we do here. Directing the helpers all day is hard work, don't you know.
- -> MudwoodIntro

= HostileRobots
n: Oh, you mean the helpers? Yes, those little bots do all the manual labor around here.
n: They also used to mine down by the river, before you got so many others involved in our conflict with Mudwood.
n: Those simpletons wouldn't even know what to do with that gold. At least we know how to trade for luxury goods.
-> MainQuestions

= MudwoodIntro
n: It's much better than walking around in the muck and mud all day, unlike those simpletons in Mudwood.
	* {City6Visit} p: What do you know about Mudwood?
	* {City6Visit} p: You have a problem with Mudwood?
	* {!City6Visit} p: What's Mudwood?
	* {!City6Visit} p: Simpletons? Who are you talking about?
- n: Oh, it's a tiny little group of buildings on the other side of the river.
n: The people there are a little more... rough around the edges, if you catch my meaning.
n: We don't mix with them when we can avoid it, though they can be a nuisance when they try to mine near the river.
	* p: Why would they mine near the river?
	* p: Why are they such a nuisance?
- n: Oh, those simpletons have it in their mind that all the gold veins around the river belong to them.
n: We clearly laid claim to it, but nearly every day we find they've run off our helpers that are trying to mine the gold.
	* p: How did you lay claim to it?
	* p: Why do they think it belongs to them?
- n: Well, we established our glorious settlment 5 years ago, and when we did we marked off the whole area with mauve ribbons.
n: The people of Mudwood had clearly never seen something as nice as a ribbon before, and totally ignored the boundary.
n: They've continued to tresspass into our lands over and over again, and we keep reminding them that we own it.
	* {City6Conflict} p: [You used purple ribbons?] Mauve? Do you mean purple ribbons?
	  n: I most certainly do not, I mean mauve. I have a keen eye for colors.
	* {City6Conflict} p: That story sounds... oddly familiar.
	  n: I'm sure I don't know what you're talking about. We clearly marked that area with our mauve ribbons, I double checked myself.
	  n: I spent a week bathing to get rid of all the dirt from that trip, but it was worth it to confirm we are in the right.
	* {!City6Conflict} p: It sounds like you do own those lands[.], if you marked the area with ribbons
	  n: Precisely. The people in Mudwood must be blind or malicious to continue to say they own those lands.
	* {!City6Conflict} p: Does that really mean you own those lands?
	  n: It certainly does. This world was free for anyone to claim, as long as those claims are made explicitly and clearly.
	  n: Marking the area with mauve ribbons was an explicit and clear sign that we owned it.
- n: Well, in any case, our conflict with Mudwood is neither here nor there.
~ City5Conflict = true
-> MainQuestions

= DanFlustered
n: He... he said that, did he? Well, I didn't think that he could... I mean, I suppose he does have his own charms...
n: I would be lying if I said I hadn't thought about... Ahem, please excuse me, this isn't something I wish to talk about further.
n: As nice as he may be, his tresspassing on our lands is really something I can't overlook.
-> MainQuestions

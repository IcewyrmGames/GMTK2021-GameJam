//City Name: Mudwood
//Leader Name: Dan
//Country bumpkins with no need for "manners" or "style"

=== City6 ===
n: Howdy there, {City5Complete == false:{~bud|friend|ah-mee-go|you|young 'un|friendo|traveler}|city-slicker}.
n: {City6 == 1: Dan's the name, Mudwood's muh home. What can I do fer ya?|What brings ya back 'round here?}
~ City6Visit = true
-> MainQuestions

= MainQuestions
	* {!City5Complete} p: I'm here on behalf of Trailways Railways and Tradeways[.] I wanted to talk to you about establishing a rail line here.
		-> RepresentativeIntro
	* {City5Complete && !RepresentativeIntro} p: I'm here on behalf of Trailways Railways and Tradeways[.] I wanted to talk to you about establishing a rail line here.
		-> HostileRepresentativeIntro
	+ {!City5Complete && RepresentativeIntro} p: About the railroad...
		-> RepresentativeConvince
	+ {City5Complete && (RepresentativeIntro || HostileRepresentativeIntro)} p: About the railroad...
		-> HostileRepresentativeConvince
	* p: This place is called Mudwood?[] That's an unusual name.
		-> MudwoodName
	* {!City5Complete} p: Is there anything of note around here?
		-> Gold
	* {City5Complete && !Gold} p: Is there anything of note around here?
		-> HostileGold
	* {City5Visit && City6Conflict} p: Dellorithy said you look mighty-fine in those overalls.
		-> DellorithyComplement
	+ p: I'll be going[.], see you around.
	  n: {City5Complete == false:Well don't be a stanger, you hear? Come back soon!|Yeah, see ya 'round.}
		-> END

= MudwoodName
n: Yes indeed it is. When we all arrived here, we found a lotta mud and a lotta wood. Called it Mudwood.
	* p: That's pretty straightforward.
	* p: That's not very creative.
- n: Heck, the people around here ain't some kinda university scientists. We all work fer a living.
n: We don't have no time to come up with fancy names fer things, so we calls 'em as we sees 'em.
	* p: Fair enough[.], that's a good way to handle it.
	* p: I guess so[.], it's your city after all.
- n: Dern right, now yer gettin' it.
-> MainQuestions

= RepresentativeIntro
n: Well heck, ain't a mouthful of nonsense. Y'all're building a railroad, right? Why don't ya just say that?
n: Look, you seem like a nice guy, but we here are... What's the word... Self-soo-fish-ent. We keep to our own.
n: I don't think we want too many city-slickers runnin' through here all the time.
	* p: The railroad could be profitable for you.
	* p: You don't see any reason to join?
- n: Aw, heck. Like I was sayin', we got everything we need here. Our own little gen-yoo-wine paradise.
n: Sorry, traveler. Looks like you gotta look somewhere else.
-> MainQuestions

= HostileRepresentativeIntro
n: Yeah, I heard about yer railroad. I heard you was fixing to help alla them fancy-pants people up in Bridgey-gale.
n: We don't want nothing to do with that railroad if you got people like that on it.
	* p: Can we work something out?
	* p: Are they really so bad?
- n: Them people up there says they own that river even though we was the ones that first got to it.
n: If yer working with them, I don't see how we can see eye-to-eye on nothin'.
-> MainQuestions

= RepresentativeConvince
n: Like I was tellin' ya before, I don't see that we'd be needing anything fancy like that any time soon.
	* {City6Conflict} p: What if I could help with the river?
		-> RiverOffer
	+ {RiverOffer} p: The company will help you with the river.
		-> RiverOfferConfirm
	+ p: But you have to join[.], everyone else is doing it.
	  n: We ain't gotta do nothin', city-slicker. You best be movin' on.
		-> END
	+ p: Okay, sorry to bring it up.
		-> MainQuestions

= HostileRepresentativeConvince
n: No-way, no-how, we ain't interested in that there railroad.
	* {City4Complete} p: What if you had a cheap supply of food?
		-> FoodOffer
	+ p: There's nothing I can do to convince you?
	  n: We got all we need right here in Mudwood, and we don't want nothin' else. You best be leavin'.
		-> END
	+ p: Sorry to bother you[.], then.
		-> MainQuestions

= Gold
n: Well, let's see. There's an ATV track 'round that nearby hill, it's pretty fun.
n: There's also some good critters you can find in the dead logs in the woods, they cook up real nice.
n: Oh yeah, and there's also all that gold around.
	* p: Ooh, ATVs are[ fun.], wait, did you say gold?
	* p: I'm always looking to try new[ foods.], wait, did you say gold?
- n: Yep, them lands around the river are just chock-full o' gold. You can't swing a stick without hittin' some.
n: We dig it up around there sometimes. Well, when we ain't fightin' off the robots from Bridgey-gale.
	* {City5Visit} p: What do you know about[ Bridginggale?]... "Bridgey-gale"?
	* {City5Visit} p: You have a problem with[ Bridginggale?]... "Bridgey-gale"?
	* {!City5Visit} p: What's "Bridgey-gale"?
	* {!City5Visit} p: Fighting? What are you talking about?
- n: Oh, up in Bridgey-gale they got a lot of fancy-pants rich folks that use robots to do all their work.
n: It's lazy, that's what it is. A person should work with their hands, gettin' down in the muck.
n: Anyway, they got it in their heads that they own the land 'round the river, even though we claimed it.
	* p: How did you lay claim to it?
	* p: Why do they think it belongs to them?
- n: Well, we rolled up on in here 'bout 5 years back. When we did, we marked off the whole area like we was supposed to.
n: Used some nice purple ribbons to do it, anyone who seen 'em would know that this land was ours.
n: But those rich fancy-pantses don't care about the rules, I reckon. They still say they own it.
n: They send their robots down there from time to time to mine the river, and we gotta fight 'em off.
	* {City5Conflict} p: You used mauve ribbons?
	  n: Mauve? What in the sam-heck is mauve? I said purple, didn't I? I know purple when I sees it.
	* {City5Conflict} p: That story sounds... oddly familiar.
	  n: Yeah, all the folks that come to this world are supposed to mark out their territory. I put up the ribbons myself.
	  n: Got lost a few times, but I made sure to put 'em up everywhere I saw.
	* {!City5Conflict} p: It sounds like you do own those lands[.], if you marked the area with ribbons.
	  n: That's what I been sayin'! But the folks up in Bridgey-gale don't let a purple ribbon stop them.
	  n: People like that, they take what they want, don't matter if it belongs to someone else.
	* {!City5Conflict} p: Does that really mean you own those lands?
	  n: You bet it does. First-come-first-serve, that's the law 'round here. We came first, so we get served first.
- n: I'm going to get too riled up if I keep talkin' bout this. Better to talk about something else, ya know?
~ City6Conflict = true
-> MainQuestions

= HostileGold
n: Well, let's see. There's an ATV track 'round that nearby hill, it's pretty fun.
n: There's also some good critters you can find in the dead logs in the woods, they cook up real nice.
n: Oh yeah, there was a bunch of gold around, but you put a stop to all that by helpin' Bridgey-gale.
n: That was a low blow, traveler. Not sure what else you want around here after taking that.
-> MainQuestions

= RiverOffer
n: Huh? What're you talkin' about?
	* p: The rail network has influence.[] If you're part of the network, others would back your claim.
	* p: You would have allies.[] If you're part of the network, others would back your claim.
- n: Well now, I reckon that's a pretty fine idea.
n: Those big-shots wouldn't be able to do nothin' if more of us were standin' against 'em.
n: If you gimme yer word that you'll help us out, then we're in!
	* p: You have my word.
		-> RiverOfferConfirm
	* p: Actually, I need to do some things first.[] Can you wait a while?
	  n: Well don't go getting our hopes up all fer nothin'. You come back when yer ready to talk.
		-> MainQuestions

= RiverOfferConfirm
n: Well boy howdy, we got ourselves a deal! Let's spit on it.
n: We'll have more gold than we know what do do with soon.
n: I'll bet some o' them other cities 'round that railroad might want some, we'll call 'em up right away!
~ City6Complete = true
-> END

= FoodOffer
n: Food? Hm, well, I do love me some good cooking. What're ya talking about, exactly?
	* p: The farms in <City4> can help [.], they're part of the rail network.
	* p: There are industrial farms [nearby.] in <City4>.
- n: Farming? Down in <City4>? Do they got any good stuff, like corn or okra?
	* p: Lots of corn.
	  n: Whoo-eee. It's been a while since I had any real good cornbread.
	* p: Lots of okra.
	  n: Whoo-eee. It's been a while since I had any real good gumbo.
- n: If they got fancy foods like that growin' down there, we sure would like to get our hands on some of it.
n: Aw heck, I can tell you ain't such a bad one. You comin' all the way out here already means a lot.
n: Tell you what, if joining this here railroad net means we get some good cookin' every once in a while, then we're in.
	* p: Glad to have you on board!
	* p: You won't regret this.
- n: If you're coming through here again any time soon, stop by my place.
n: I'll make you some of my double-devil fiery death lava chili. It's the least I can can do fer everythin' you've done.
	* p: That sounds... delicious.
	* p: That sounds delicious!
- n: You better believe it! Take care now.
~ City6Complete = true
-> END

= DellorithyComplement
n: Well she said that, did she? Aw, that's a mighty nice thing for her to say.
n: You know, I always tell people 'round here that even if those people in Bridgey-gale are snooty, they ain't all bad.
n: If they could just stop fightin' us over that there river, we might even be close someday. Maybe someday.
-> MainQuestions

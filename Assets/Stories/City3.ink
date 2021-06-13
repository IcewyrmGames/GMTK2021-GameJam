VAR City3BadExits = 0

=== City3 ===
n: Welcome te Tornsburg, {City3 == 1: stranger|{~friend|traveler}}. {City3 == 1: The names Bilge. }What can I do for ye? -> MainQuestions

= MainQuestions
<>
* p: Bilge is an unusual name[.], isn't it?
	-> BilgeName
* p: Tell me about your city[], I'm not familiar with it.
	-> TornsburgInfo
* p: Can you tell me about the area?[] I'm afraid I don't know much.
	-> TornsburgArea
* p: I'm here to meet you, actually.
	-> IntroduceYourself
+ {IntroduceYourself} p: I want to make a business proposition.
	-> Proposition
+ p: Just passing through[], sorry to bother you.
	-> Exit

= Exit
n: No bother at all, friend! Come back through any time.
-> END

= BadExit
n: Clearly ye've got no sense about ye, friend. Come back when ye're ready to talk like a reasonable person.
~ City3BadExits++
-> END

= BilgeName
n: Oh, and I suppose you think a name like "Steven" isn't strange, aye? Names come in all sorts, friend.
n: Bilge is a family name, going back for generations. The Bilges are always there for others, to bail them out.
	* p: I meant no offense[.], I'm just not used to names like that.
		-> MainQuestions
	* p: It's still a strange name[.], you must admit.
		-> BadExit

= TornsburgInfo
n: Ye've come to the jewel of the mountains, friend! Tornsburg is a hard place, but the people here are harder.
n: We come from a world much less hospitable than this one. Fully of craggy ice and beasties that kill on sight.
n: Any challenge that may arise, I assure you that we'll be more than capable of facing it.
	* p: Impressive[!], you certainly look like people that can handle themselves.
	* p: Incredible[!], it's hard to imagine coming from such a harsh place!
	* p: Hard to believe[...], but I have no doubt that you are a capable people.
- n: Indeed. What brings you around to these parts?
	* p: I heard the stories about you[.], I'm glad to see the truth of them!
	* p: I'm learning more about settlements in the area[.], thought I might take a look around.
- ->MainQuestions

= TornsburgArea
n: Tornsburg is in rocky lands, but ye'll be hard-pressed to find a more rich place.
n: We've laid claim to all these mountains here, and the ores within them.
	* p: What kind of ores?
		-> Ores
	* p: Are those really that valuable?
		-> ValuableOres
	* p: That's all, just a bunch of rocks?
		-> ValuableOres

= ValuableOres
n: Are ye mad? Ore is the heart of any great civilization. Ye can't build a massive sprawling city on the surface without first digging deep under the ground.
	* p: I guess you're right[.], I didn't think about it that way.
		-> OresUseful
	* p: You clearly know what you're talking about[.] I don't mean to challenge you.
		-> OresUseful
	* {!Ores} p: What kind of ores[?] do you have around here?
		-> Ores
	* p: That's clearly an overstatement.
		-> BadExit

= OresUseful
n: Aye, with iron ores from our mountains, this could one day be a metropolis to rival old Earth.
-> MainQuestions

= Ores
n: Iron ores, that's what kind! The biggest iron ore veins ye'll find for hundreds of miles.
	* p: How do you mine that ore[?], is it difficult?
		-> MiningOres
	* p: Sounds like a lot of work.
		-> MiningOres
	* {!ValuableOres} p: Iron ore doesn't seem that valuable.
		-> ValuableOres

= MiningOres
n: We've got shafts running deep through these mountains, carving them out from the inside. It's dark and dirty work, but we'll overcome it.
	* p: I can't imagine being that far underground[.] It sounds horrible.
	* p: So deep...[] I would have nightmares from something like that.
	* p: That sounds awful.
- n: Ha, ye're exactly right! It's an awful job, but someone needs to do it!
	-> MainQuestions

= IntroduceYourself
n: And who exactly are ye?
	* p: I'm setting up a rail system all throughout the region.
	* p: I'm creating a trade network between all the nearby settlements.
	* p: I'm improving the lives of all settlements in this area.
- n: Hm, not every day I hear about something like that. How are you managing that?
	* p: I work for Trailways Railways & Tradeways.
	* p: I work for that one rail company with the ridiculous name.
- n: Ah, I've heard a little bit about ye before. Ye've been going around to settlements making offers and such.
-> Proposition

= Proposition
n: What are ye offering, that ye think we need?
	+ {!TornsburgInfo || !TornsburgArea} p: Well, I'm not sure yet, actually.
		-> MainQuestions
	+ {!TornsburgInfo || !TornsburgArea} p: Can I ask you a few questions?
		-> MainQuestions
	* {TornsburgInfo && TornsburgArea} p: Your people seem quite industrious[.], have you thought of setting up steel production?
		-> SteelProduction
	* {TornsburgInfo && TornsburgArea} p: Iron ore is plentiful here[.], have you thought of setting up steel production?
		-> SteelProduction
	* p: Perhaps a backrub?
		-> BadExit

= SteelProduction
n: Now that's an idea, and one we've thought of before, but we haven't the resources to do something like that.
n: Ye need a steady supply of good coal to make steel.
	* p: Coal is something I can provide[.], Gwuff Hills has already agreed to join our rail network.
	* p: I think I have what you need[.], have you heard of Gruff Hills? We've already set up rail lines there.
- n: Gwuff Hills! They've joined you already? Now that is an interesting fact...
n: {City3BadExits < 1: Ha, this isn't yer first negotiation, is it!|Yer lucky to have such good tactics to make up for yer lack of tact.} People like ye know te come prepared already!
n: Alright, friend. If joining your network means access to coal, we can set up a steel industry right here in Tornsburg.
~ City3Complete = true
-> END

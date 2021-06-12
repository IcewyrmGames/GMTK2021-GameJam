VAR City3BadExits = 0

=== City3 ===
Welcome te Tornsburg, {City3 == 1: stranger|{~friend|traveler}}. {City3 == 1: The names Bilge. }What can I do for ye? -> MainQuestions

= MainQuestions
<>
* Bilge is an unusual name[.], isn't it?
	-> BilgeName
* Tell me about your city[], I'm not familiar with it.
	-> TornsburgInfo
* Can you tell me about the area?[] I'm afraid I don't know much.
	-> TornsburgArea
* I'm here to meet you, actually.
	-> IntroduceYourself
+ {IntroduceYourself} I want to make a business proposition.
	-> Proposition
+ Just passing through[], sorry to bother you.
	-> Exit

= Exit
No bother at all, friend! Come back through any time.
-> END

= BadExit
Clearly ye've got no sense about ye, friend. Come back when ye're ready to talk like a reasonable person.
~ City3BadExits++
-> END

= BilgeName
Oh, and I suppose you think a name like "Steven" isn't strange, aye? Names come in all sorts, friend.
Bilge is a family name, going back for generations. The Bilges are always there for others, to bail them out.
	* I meant no offense[.], I'm just not used to names like that.
		-> MainQuestions
	* It's still a strange name[.], you must admit.
		-> BadExit

= TornsburgInfo
Ye've come to the jewel of the mountains, friend! Tornsburg is a hard place, but the people here are harder.
We come from a world much less hospitable than this one. Fully of craggy ice and beasties that kill on sight.
Any challenge that may arise, I assure you that we'll be more than capable of facing it.
	* Impressive[!], you certainly look like people that can handle themselves.
	* Incredible[!], it's hard to imagine coming from such a harsh place!
	* Hard to believe[...] but I have no doubt that you are a capable people.
- Indeed. What brings you around to these parts?
	* [I have a business proposition] Well, I have a business proposition, if you're interested
		-> Proposition
	* Just passing through[], thought I might take a look around the area
		-> MainQuestions

= TornsburgArea
Tornsburg is in rocky lands, but ye'll be hard-pressed to find a more rich place.
We've laid claim to all these mountains here, and the ores within them.
	* What kind of ores?
		-> Ores
	* Are those really that valuable?
		-> ValuableOres
	* That's all, just a bunch of rocks?
		-> ValuableOres

= ValuableOres
Are ye mad? Ore is the heart of any great civilization. Ye can't build a massive sprawling city on the surface without first digging deep under the ground.
	* I guess you're right[.], I didn't think about it that way.
		-> OresUseful
	* You clearly know what you're talking about[.] I don't mean to challenge you.
		-> OresUseful
	* {!Ores} What kind of ores[?] do you have around here?
		-> Ores
	* That's clearly an overstatement.
		-> BadExit

= OresUseful
Aye, with iron ores from our mountains, this could one day be a metropolis to rival old Earth.
-> MainQuestions

= Ores
Iron ores, that's what kind! The biggest iron ore veins ye'll find for hundreds of miles.
	* How do you mine that ore[?], is it difficult?
		-> MiningOres
	* Sounds like a lot of work.
		-> MiningOres
	* {!ValuableOres} Iron ore doesn't seem that valuable.
		-> ValuableOres

= MiningOres
We've got shafts running deep through these mountains, carving them out from the inside. It's dark and dirty work, but we'll overcome it.
	* I can't imagine being that far underground[.] It sounds horrible.
	* So deep...[] I would have nightmares from something like that.
	* That sounds awful.
- Ha, ye're exactly right! It's an awful job, but someone needs to do it!
	-> MainQuestions

= IntroduceYourself
And who exactly are ye?
	* I'm setting up a rail system all throughout the region.
	* I'm creating a trade network between all the nearby settlements.
	* I'm improving the lives of all settlements in this area.
- Hm, not every day I hear about something like that. How are you managing that?
	* I work for Trailways Railways & Tradeways.
	* I work for that one rail company with the ridiculous name.
- Ah, I've heard a little bit about ye before. Ye've been going around to settlements making offers and such.
-> Proposition

= Proposition
What are ye offering, that ye think we need?
	+ {!TornsburgInfo || !TornsburgArea} Well, I'm not sure yet, actually.
		-> MainQuestions
	+ {!TornsburgInfo || !TornsburgArea} Can I ask you a few questions?
		-> MainQuestions
	* {TornsburgInfo && TornsburgArea} Your people seem quite industrious[.], have you thought of setting up steel production?
		-> SteelProduction
	* {TornsburgInfo && TornsburgArea} Iron ore is plentiful here[.], have you thought of setting up steel production?
		-> SteelProduction
	* Perhaps a backrub?
		-> BadExit

= SteelProduction
Now that's an idea, and one we've thought of before, but we haven't the resources to do something like that.
Ye need a steady supply of good coal to make steel.
	* Coal is something I can provide[.], <City2> has already agreed to join our rail network.
	* I think I have what you need[.], have you heard of <City2>? We've already set up rail lines there.
- <City2>! They've joined you already? Now that is an interesting fact...
{City3BadExits < 1: Ha, this isn't yer first negotiation, is it!|Yer lucky to have such good tactics to make up for yer lack of tact.} People like ye know te come prepared already!
Alright, friend. If joining your network means access to coal, we can set up a steel industry right here in Tornsburg.
~ City3Complete = true
-> END

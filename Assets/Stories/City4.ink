// STITCH LIST
// -----------
// First Visit
// Welcome
// HowCanIHelp
// AboutCity
// Convince
// Unconvinced
// IMustGo
// StreamlineFoodProduction
// Exit
// CompleteCity

=== City4 ===

{ City4 == 1: -> FirstVisit | -> Welcome }
    
= FirstVisit
s: You make your way to the {City4Name}. A dirt path brings you through wide fields with occasional crop plots. The plants droop lazily, but are peppered with bright shades of every color on the rainbow.
n: Oh. You have arrived.
s: A women, dressed in all black, peeks at you from the bottom of her sunhat.
* p: Were you expecting me?
    n: Expecting you? No, I am just noting your arrival. <>
* p: Hello there!
    n: Hi. <>
- What are you?
* p: What am I? Don't you mean WHO am I?
n: I meant exactly as I asked.
s: She twirls her hair around her finger, absentmindedly.
* p: Uh... Right back atcha?
n: I am a plant whisperer, of course! I'm suprised you had to ask!
- -> Welcome
    
= Welcome
n: Welcome to the {City4Name}, where the plants whisper to us their needs.
{ Welcome == 1: s: She curtsies, exposing the depth of blackness in the layers of her skirt. }
* p: Like - Literally?
n: Of course. Can't you hear them?
s: She closes her eyes, raising her chin slightly.
+ p: How... nice.
~ BeNiceToCity4Leader--
+ p: "Thank you! I'm happy to be here."
~ BeNiceToCity4Leader++
- -> HowCanIHelp

= HowCanIHelp
n: {~ So, what is is that I can help you with?|What can I do for you?|How might I help you today?}
* p: Tell me more about the {City4Name}.
    -> AboutCity
+ p: I am here to share details about my company, {CompanyName}.
    { Convince < 1: n: Oh? }
    { Convince < 3: -> Convince }
    { Convince > 2: -> IMustGo }
+ p: {~ Actually, I'm just passing through.|I'm good for now. I'm sure we will speak again.|Nothing, really. I'll stop by later.}
-> Exit

= AboutCity
n: We are a city of simple farmers. Our plants need us, you see. We rely on each other to make this a peaceful space. While the work can be slow, we are all quite happy here.
-> HowCanIHelp

= Convince
+ p: We are working to connect all settlements in {PlanetName}. We want you to join.
    { Convince == 1: n: Join? Other... settlements? }
    { Convince == 1: s: She looks a bit shocked. }
    { Convince == 1: n: Now what good would that do us? }
    ** p: Well... your plants could... have more friends?
        n: While I do admit they are quite sociable, I'm not sure they would like their air space intruded with the sounds and smells of transit. We must decline.
        -> HowCanIHelp
    ++ -> Unconvinced
+ { City3Complete == true } p: What would you say if we could help you streamline your food production?
    -> StreamlineFoodProduction

= Unconvinced
n: {~ So you say. | Hm. | Yes, you mentioned that. }
        -> HowCanIHelp
		
* p: We are working together to make the world a better place. 
    n: Really.
    s: She looks down at her fingertips, examining a nail. 
    -> HowCanIHelp
    
= StreamlineFoodProduction
* p: What would you say if we could help you streamline your food production?
    s: Her ears perk up.
    -> CompleteCity

-> HowCanIHelp

= IMustGo
n: Yes, I've heard this a number of times now. I'm afraid I must be off.
-> Exit

= Exit
n: {~ I'm glad our crops got to breathe in a new face. |Do come again. | Fare well, traveler. }
-> END

= CompleteCity
n: That would be quite lovely, wouldn't it? Consider us a part of your group.
~ City4Complete = true
-> END
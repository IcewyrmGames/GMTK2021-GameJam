// STITCH LIST
// -----------
// First Visit
// Welcome
// HowCanIHelp
// AboutCity
// Convince
// StreamlineFoodProduction
// Exit
// CompleteCity

=== City4 ===

// TESTING NOTES
{viewGameInformation()}
//

{ City4 == 1: -> FirstVisit | -> Welcome }
    
= FirstVisit
s: You make your way to city 4. A dirt path brings you through wide fields, with occasional plots of crop. The crops are droopy, but peppered with bright and cheery shades of the rainbow. 
n: "Oh. You have arrived."
* p: "Were you expecting me?"
    -- n: "Expecting you? No, I am just noting your arrival. <>
* p: "Hello there!"
    -- n: "Hi. <>
- n: <> What are you?"
* p: "What am I? Don't you mean WHO am I?"
-- n: "I meant exactly as I asked." She twirls her hair around her finger, absentmindedly.
* p: "Uh... Right back atcha."
-- n: "I am a plant whisperer, of course! I'm suprised you had to ask!"
- -> Welcome
    
= Welcome
- n: "Welcome to the {City4Name}, where the plants whisper to us their needs." { City4.FirstVisit } She curtsies, exposing the depth of blackness in the layers of her skirt.
* p: "Like - Literally?"
-- n: "Of course. Can't you hear them?" She closes her eyes, raising her chin slightly.
+ p: "How... nice."
~ BeNiceToCity4Leader--
+ p: "Thank you! I'm happy to be here."
~ BeNiceToCity4Leader++
- -> HowCanIHelp

= HowCanIHelp
n: "So, what is is that I can help you with?"
* p: "Tell me more about the {City4Name}."
    -> AboutCity
+ p: "I am here to share with you details about my company, {CompanyName}. 
    -- n: "Oh?" 
    -> Convince
+ p: {~ "Actually, I'm just passing through."|"I'm good for now. I'm sure we will speak again."|"Nothing, really. I'll stop by later."}
-> Exit

= AboutCity
* n: "We are a city of simple farmers. Our plants need us, you see. We rely on each other to make this a peaceful space. While the work can be slow, we are all quite happy here."
-> HowCanIHelp

= Convince
* p: "{CompanyName} is working to connect all settlements in {PlanetName}. We want you to join."
    -- n: "Join? Other... settlements?" 
    -- s: She looks a bit shocked. 
    -- n: "Now what good would that do us?"
    ** p: "Well... your plants could... have more friends?"
        --- n: "While I do admit they are quite sociable, I'm not sure they would like their air space intruded with the sounds and smells of transit. We must decline."
        --- -> HowCanIHelp
    ++ { City3Complete == true } p: "What would you say if we could help you streamline your food production?"
        -> StreamlineFoodProduction
		
* p: "I represent {CompanyName}. We are working together to make the world a better place." 
    -- n: "Really."
    -- s: She looks down at her fingertips, examining a nail. 
    -- -> HowCanIHelp
    
= StreamlineFoodProduction
* p: "What would you say if we could help you streamline your food production?"
    -- s: Her ears perk up.
    -- -> CompleteCity

-> HowCanIHelp

= Exit
n: {~ She curtsies again. "I'm glad our crops got to breathe in a new face." |"Do come again." | "Fare well, traveler." }
-> END

= CompleteCity
n: "That would be quite lovely, wouldn't it? Consider us a part of your group."
~ City4Complete = true

// TESTING NOTES
{viewGameInformation()}
// TESTING NOTES
-> END
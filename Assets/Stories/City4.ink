VAR ConvinceAttempt = 0
VAR ConvinceView = 0

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
* {Welcome == 1} p: Like - Literally?
    n: Of course. Can't you hear them?
    s: She closes her eyes, raising her chin slightly.
* {Welcome == 1} p: That must be kind of creepy.
    n: Oh, not at all. We love to hear from our friends, no?
+ -> HowCanIHelp
- -> HowCanIHelp

= HowCanIHelp
n: {~ So, what is is that I can help you with?|What can I do for you?|How might I help you today?}
* p: Tell me more about the {City4Name}.
    -> AboutCity
+ p: {~ I am here to share details about my company, | I hope to share an idea from my company,} {CompanyName}.
    n: {~ Hmm. I'm listening. | What do you have to say?}
    -> Convince 
+ p: {~ Actually, I'm just passing through.|I'm good for now. I'm sure we will speak again.|Nothing, really. I'll stop by later.}
-> Exit

= AboutCity
n: We are a city of simple farmers. Our plants need us, you see. We rely on each other to make this a peaceful space. While the work can be slow, we are all quite happy here.
-> HowCanIHelp

= Convince
+ p: {~ We are working to connect all settlements in Nevosis. We want you to join.| We want you to join our railway network. }
        n: {~ What good would that do us?| Why should we? | What's in it for us and our plant friends? }
        ** p: Well... your plants could... have more friends?
            n: While I admit they are quite sociable, I'm not sure they would like the smells of transit. We decline.
                -> Exit
        ++ { City3Complete == true } p: What would you say if we could help you streamline your food production? 
            -> StreamlineFoodProduction
        ** p: You... you could have more friends!
            n: I hope you are not suggesting our plant friends here don't count.
            -> HowCanIHelp
        ++ p: To be honest, I'm not sure yet.
            -> HowCanIHelp

* p: We would like to work with you to make the world a better place. 
    n: Really. That's quite the statement.
    s: She looks down at her fingertips, examining a nail. 
    ~ ConvinceAttempt++
    -> Unconvinced

= Unconvinced
n: {~ So you say. I'm unconvinced. | Hm. Not quite the tea. | An interesting idea. Though, I have no interest. }
-> HowCanIHelp
    
= IMustGo
n: Yes, I've heard this before. I'm afraid I must be off.
-> Exit

= Exit
n: {~ I'm glad our crops got to breathe in a new face. |Do come again. | Fare well, traveler. }
-> END

= StreamlineFoodProduction
s: Her ears perk up.
-> CompleteCity

= CompleteCity
n: That would be quite lovely, wouldn't it? Consider us a part of your group.
~ City4Complete = true
-> END
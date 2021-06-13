VAR ComplainedAboutFood = false

=== City1 ===
// STITCHES
// --------

-> Touchdown
= Touchdown
s: Your ship touches down. This is it - the {City1Name}. 
s: A lithe, anxious seeming middle aged man rushes to your door once you land, followed by a small flock of people. They turn gawk at the side of the ship, where "Trailway Railways & Trade" is painted boldly.

n: Hello! Hello, how are you, how was the airspace, how are you doing - it is absolutely WONDEROUS to see you.
    * p: [Smile and reach for a handshake.] Hello there {City1Leader}. I see you are energetic as always!
      s: You grasp his hand warmly.
    ~ BeNiceToCity1Leader++
    * p: [Nod your head.] You nod, simply.
- n: Well then. I hope you have worked up an appetite, because we have quite the dinner prepared!
s: He starts walking towards the settlement and beckons you to follow. He passes several buildings, pointing out their usefulness until you arrive at a small, cozy banquet hall. He leads you to sit at a long table in the corner.
n: Ah, how we’ll be in the history books. Imagine, second Earth’s largest metropolis, started right here in this very town.
s: He gazes off in the distance as plates of steaming food are placed in front of you.
* p: I'm glad to see you are as excited as I am!
~ BeNiceToCity1Leader++
* p: Yes, yes... very exciting. 
~ BeNiceToCity1Leader--
- s: You plow into the food. While the taste is good, the meat is oddly... crunchy? Like there's... sand? Is that... bone?
* [s: Complain.]
p: This texture is... leaving something to be desired. Could you not come up with something better?
~ BeNiceToCity1Leader--
    s: {City1Leader}'s face falls.
    ~ ComplainedAboutFood = true
* [s: Keep it positive.] p: The flavor of this meal is divine.
~BeNiceToCity1Leader++
    s: {City1Leader}'s face lights up.
- n: That is our region's delicacy... fresh Moostac, caught just yesterday and brought in with a day's travel.

{ ComplainedAboutFood == true:
    -> FoodComplaint
- else:
    -> QuestionsAndAnswers
}

= FoodComplaint
n: I fear we are limited in our options before trade with Earth is better established. We just don't have the same kind of infrastructure established here just yet.
s: He brightens up.
n: It won't be long though! Perhaps next time we can try something else.
-> QuestionsAndAnswers

= QuestionsAndAnswers
{!QuestionsAndAnswers == 0: n: Well, speaking of next time, I know our time is short before you have to move on to work with the other settlements. Do you have any questions for me?}
{QuestionsAndAnswers == 1: n: Do you have any more questions?}

* p: What's the best way to convince the settlements to join us?
    n: Why, I'm sure everyone will be estatic to join your railway network. Why wouldn't they be?
        ** p: I think if that were the case, we would have received more responses in our outreach...
        n: Well, I'm sure they just need a little more convincing. I'm sure after a little conversation it will become clear what will make them say yes.
        -> QuestionsAndAnswers
* p: Where did you get such a fine suit?
    n: Oh my. Why thank you. I have a wonderful tailor here, his name is Sherry, let me give you his card...
    ~BeNiceToCity1Leader++
    -> QuestionsAndAnswers
* p: No, I think I'm good. 
    { BeNiceToCity1Leader > 2: 
        -> EarthSnacks
        - else: 
        -> CompleteCity
    }

= EarthSnacks
 n: Just so you know, I heard Gula is itching to increase shipments of Earth Snacks. If you hook her up, I'm sure she'll be jumping to join in no time. 
 * p: Thanks for the tip!
-> CompleteCity

= CompleteCity

s: After your meal, you have a quiet evening in one of {City1Leader}'s Apartment Pods to prepare for your next day of travels.
~ City1Complete = true
-> END


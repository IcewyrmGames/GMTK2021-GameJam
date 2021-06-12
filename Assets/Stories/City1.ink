=== City1 ===
-> Touchdown

= Touchdown
s: Your ship touches down. This is it - the {City1Name}. 
s: The door of your ship opens. A lithe, anxious seeming middle aged man rushes to your door, followed by a small flock of people. They turn gawk at the side of the ship, where "Trailway Railways & Trade" is painted boldly.

n: "Hello!! Hello, how are you, how was the airspace, how are you doing - it is absolutely WONDEROUS to see you."
    * p: [Smile and reach for a handshake.] "Hello there {City1Leader}. I see you are energetic as always!" You grasp his hand warmly.
    ~ BeNiceToCity1Leader++
    * p: [Nod your head.] You nod, simply.
- n: "Did you sleep well? Can I get you anything? A vessel of water, perhaps -"
    * p: "{City1Leader}, apologies, but I am quite weary from travels. Shall we head in?"
    -- n: "Oh, yes yes. Let's."
    * p: "A small moment of peace, perhaps?"
    ~ BeNiceToCity1Leader--
    -- n: His face falls. "Oh. Yes, of course."
- s: He starts walking towards the settlement and beckons you to follow. He passes several buildings, pointing out their usefulness until you arrive at a small nest of apartment pods.
- n: "This is where you will be staying while you are at the {City1Name}, and shall you need anything at all, just use the intercom and someone will be  there to assist you!"
->nextDay

= nextDay
s: You awake, refreshed. After preparing for the day, you connect with {City1Leader} over the intercom and plan to connect over breakfast before you depart for your next settlement.
s: An assistant is waiting at the door when you leave your pod. You are led to a small, cozy banquet hall. It is bustling with people, laughing and generally having a good time. Warm woods spread through the halls. You an Digby sit on an elevated table off to the side of the room. He high-fives several children on the way to sit down. 
* p: "So. Digby. Remind me what the plan is again?"
-- UNFINISHED
* p: "How was your rest?"
~ BeNiceToCity1Leader++
-- p:UNFINISHED

// BeNiceToDigby SCORE!!
//
- Your be nice to {City1Leader} score is currently {BeNiceToCity1Leader}.
//
//

-> EarthSnacks

= EarthSnacks
Digby tells you about city1 and discusses their interest in Earth snacks. You continue on to the next city with this knowledge.
    * s: Continue
    -> CompleteCity

= CompleteCity

s: City1 is now complete for trade! And you are ready to go.
~ City1Complete = true
-> END


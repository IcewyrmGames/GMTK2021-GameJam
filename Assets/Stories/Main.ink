// City Completion
VAR City1Complete = false
VAR City2Complete = false
VAR City3Complete = false
VAR City4Complete = false
VAR City5Complete = false
VAR City6Complete = false

VAR City5Visit = false
VAR City6Visit = false
VAR City5Conflict = false
VAR City6Conflict = false

VAR CompanyName = "Trailways Railways & Tradeways"
// Technically the company is called Trailways and what they do is Railways and Tradeways.
VAR PlanetName = "Nevosis"

// City Details
VAR City1Name = "Port of Nevosis" 
VAR City1Leader = "Digby"
VAR City2Name = "Gwuff Hills" 
VAR City2Leader = "Gula"
VAR City4Name = "City of Whispering Seeds" 
VAR City4Leader = "Elvira"

// Niceness Scores
VAR BeNiceToCity1Leader = 0
VAR BeNiceToCity2Leader = 0
VAR BeNiceToCity4Leader = 0

-> City1
INCLUDE City1.ink
INCLUDE City2.ink
INCLUDE City3.ink
INCLUDE City4.ink
INCLUDE City5.ink
INCLUDE City6.ink

=== function viewGameInformation ===
GAME INFORMATION: 

Total Number of Turns: {TURNS()}
City 1 Leader Niceness Score: {BeNiceToCity1Leader}
City 2 Leader Niceness Score: {BeNiceToCity4Leader}
City 4 Leader Niceness Score: {BeNiceToCity4Leader}

City 1 Complete = {City1Complete}
City 2 Complete = {City1Complete}
City 3 Complete = {City1Complete}
City 4 Complete = {City1Complete}
City 5 Complete = {City1Complete}
City 6 Complete = {City1Complete}

=== function city1Niceness ===
City 1 Leader Niceness Score: {BeNiceToCity1Leader}

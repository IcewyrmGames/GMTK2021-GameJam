//City Name: Mudwood
//Leader Name: Dan
//Country bumpkins with no need for "manners" or "style"

=== City6 ===
INCOMPLETE Encountered Dan in Mudwood
~ City6Visit = true
	+ Talk To Dan
		-> TalkToDan
	* Leave
		-> END

= TalkToDan
Dan talks about the problem with City5
~ City6Conflict = true
	* {!City5Complete} Side with City6
		-> SideWithCity
	* {City5Complete} Offer something else
		-> OtherOffer

= SideWithCity
City6 completed
~ City6Complete = true
-> END

= OtherOffer
City6 complete after City5
~ City6Complete = true
-> END

# README

"It is more blessed to give than to receive." Acts 20:35

This Ruby on Rails web application was created to simplify the coordination of a Holiday gift exchange. Prior to 
using this solution, my family would draw names out of a hat and then have to coordinate the gift exchange via 
a Google Doc. Participants would add their wish list or gift ideas to the Google Doc. People who wanted to buy gifts
would look at the wish list, and then go buy something. There are a handful of problems with this approach:

1. Duplicates - unless somethign is done, there is no way to know if someone else has already purchased the gift listed.
2. No surprises - if you are buying a gift for someone, you could avoid Problem #1 by crossing off the item, so that no one else buys it. However, the recipient of the gift and author of the wish list can now see that someone is giving that gift to them.

This application solves these problems by allowing participants to create a wish list, and then allowing other participants to claim items on the wish list. Once an item is claimed, it is no longer visible to other participants. This allows for the element of surprise, while also preventing duplicate gifts.

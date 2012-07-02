@backlog
Feature: Show location age
As an observer
I want to see how long ago a user's location was updated
So I will not be confused by old locations

Scenario: Show fresh location
Given it's 4:00pm
And somebody named "nusco" is at 44.6668250°, 11.4927306°
When it is 4:04pm
And I open "http://wherewhere.is/nusco"
Then I should see "nusco is here:"

Scenario: Show aging location
Given it's 4:00pm
And somebody named "nusco" is at 44.6668250°, 11.4927306°
When it is 4:59pm
And I open "http://wherewhere.is/nusco"
Then I should see "59 minutes ago, nusco was here:"

Scenario: Remove one-hour old location
Given it's 4:00pm
And somebody named "nusco" is at 44.6668250°, 11.4927306°
When it is 5:00pm
And I open "http://wherewhere.is/nusco"
Then I should see "WhereWhere doesn't know where nusco is"

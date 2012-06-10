@backlog
Feature: Locate someone
As an observer
I want a page showing someone's location
So I can see where she is

Scenario: Locate someone
Given somebody named "nusco" sends location 44.6668250°, 011.4927306°
When I open "http://wherewhere.is/nusco"
Then I should see a mark at 44.6668250°, 011.4927306°

Scenario: Locate with random case
Given somebody named "nusco" sends location 44.6668250°, 011.4927306°
When I open "http://wherewhere.is/NuScO"
Then I should see a mark at 44.6668250°, 011.4927306°

Scenario: Location failure
When I open "http://wherewhere.is/unknown_person"
Then I should see "WhereWhere doesn't know where unknown_person is"

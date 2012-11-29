Feature: Creating an event

	 As an admin
	 So that I can notify students about upcoming events
	 I want to be able to create new events for my school

Background: the user is logged in as an admin

  Given the following schools exist:
  | name       | uri      |
  | Berkeley   | berkeley |

  And the following users exist:
  | name       | email             		| school    | admin		|
  | name       | bruh@berkeley.edu 		| berkeley  |	false 	|
  | admin      | admin@berkeley.edu   | berkeley  |	true 		|

Scenario: Create an event ( Happy )
	  Given I am logged in as "admin@berkeley.edu"
	  Given I am on the Events page
	  When I fill in "name" with "event name"
	  And I fill in "description" with "event description"
	  And I fill in "location" with "event location"

	  And I select "2012" from "event_startTime_1i"
	  And I select "November" from "event_startTime_2i"
	  And I select "20" from "event_startTime_3i"
	  And I select "12 AM" from "event_startTime_4i"
	  And I select "00" from "event_startTime_5i"

	  And I select "2012" from "event_endTime_1i"
	  And I select "November" from "event_endTime_2i"
	  And I select "20" from "event_endTime_3i"
	  And I select "12 AM" from "event_endTime_4i"
	  And I select "30" from "event_endTime_5i"
	  
	  And I press "Create Event"
	  Then I should see "Upcoming Events"
	  And I should see "event name"

	  Given I am on the Berkeley page
	  Then I should see "event name"

Scenario: Create an event ( Sad )
	  Given I am logged in as "admin@berkeley.edu"
	  Given I am on the Events page
	  And I fill in "description" with "event description"
	  And I fill in "location" with "event location"

	  And I select "2012" from "event_startTime_1i"
	  And I select "November" from "event_startTime_2i"
	  And I select "20" from "event_startTime_3i"
	  And I select "12 AM" from "event_startTime_4i"
	  And I select "00" from "event_startTime_5i"

	  And I select "2012" from "event_endTime_1i"
	  And I select "November" from "event_endTime_2i"
	  And I select "20" from "event_endTime_3i"
	  And I select "12 AM" from "event_endTime_4i"
	  And I select "30" from "event_endTime_5i"
	  
	  And I press "Create Event"
	  Then I should see "Upcoming Events"
	  And I should not see "event description"
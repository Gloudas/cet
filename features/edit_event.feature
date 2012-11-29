Feature: Edit an existing event
	 
	 As an Admin
	 So that I can modify event information after creation
	 I want to be able to edit an event

Background: the user is logged in as an admin

  Given the following schools exist:
  | name       | uri      |
  | Berkeley   | berkeley |

  And the following users exist:
  | name       | email             		| school    | admin		|
  | name       | bruh@berkeley.edu 		| berkeley  |	false 	|
  | admin      | admin@berkeley.edu   | berkeley  |	true 		|

  And the following events exist:
  | name       | description                      |
  | event name | event description                |

Scenario: Edit an event ( happy )

	  Given I am logged in as "admin@berkeley.edu"
	  Given I am on the Events page
	  And I follow "Edit"
	  And I fill in "description" with "new description"
	  And I press "Update Event"
	  Then I should see "Upcoming Events"
	  And I should see "new description"

Scenario: Edit an event ( sad )

	  Given I am logged in as "admin@berkeley.edu"
	  Given I am on the Events page
	  And I follow "Edit"
	  And I fill in "description" with "new description"
	  And I fill in "name" with ""
	  And I press "Update Event"
	  Then I should see "Upcoming Events"
	  And I should see "event description"
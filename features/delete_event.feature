Feature: Delete an existing event
	 
	 As an Admin
	 So that I can remove events
	 I want to be able to delete an existing event

Background: the user is logged in as an admin

  Given the following schools exist:
  | name       | uri      |
  | Berkeley   | berkeley |

  And the following users exist:
  | name       | email             		| school    | admin		|
  | name       | bruh@berkeley.edu 		| berkeley  |	false 	|
  | admin      | admin@berkeley.edu   | berkeley  |	true 		|

  And the following events exist:
  | name       | description           |
  | event name | event description     |

Scenario: Delete an event

	  Given I am logged in as "admin@berkeley.edu"
	  Given I am on the Events page
	  And I press "Delete"
	  Then I should see "Upcoming Events"
	  And I should not see "event name"

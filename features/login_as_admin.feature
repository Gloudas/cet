Feature: Logging in as an admin

  As an admin
  So that I can notify students about upcoming events
  I want to have edit, delete, and add access to my school's upcoming events

Background: the user is logged in as an admin

  Given the following schools exist:
  | name       | uri      |
  | Berkeley   | berkeley |

  And the following users exist:
  | name       | email             		| school    | admin		|
  | name       | bruh@berkeley.edu 		| berkeley  |	false 	|
  | admin      | admin@berkeley.edu   | berkeley  |	true 		|
  
	Given I am logged in as "admin@berkeley.edu"

Scenario: Logging in as admin 
  Given I am on the Berkeley page
  Then I should see "Manage Events"

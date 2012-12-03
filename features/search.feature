Feature: searching for a user or event or project
	
	As a user
	So that I can search for users, events or projects
	I want to implement a search bar

Background: student is logged into ai2
  Given the following schools exist:
  | name      | uri      |
  | Berkeley  | berkeley |

  And the following users exist:
  | name      | email             | school   | admin	|
  | Breh      | breh@berkeley.edu | berkeley | false	|
  | Bro 	    | bro@berkeley.edu  |	berkeley | false	|

  Given I am logged in as "bro@berkeley.edu"
  And I am on the new project page
  When I fill in "title" with "My New Project"
  And I fill in "description" with "Here is the description for my project"
  And I press "Create Project"
  Then I should see "My New Project"

Scenario: Search for a project
  Given I am on the Berkeley page
  When I fill in "searchbar" with "My New Project"
  And I enter my search terms
  Then I should see "Here is the description for my project"

Scenario: Search for a user
  Given I am on the Berkeley page
  When I fill in "searchbar" with "Breh"
  And I enter my search terms
  Then I should see "breh@berkeley.edu"

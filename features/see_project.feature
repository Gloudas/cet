Feature: Viewing created projects

  As a student
  So that I can see projects
  I want to see my projects on my profile page and other projects on the school homepage

Background: the student is logged into the berkeley site and a project created
  
  Given the following schools exist:
  | name      | uri      |
  | Berkeley  | berkeley |

  And the following users exist:
  | name      | email             | school   | admin	|
  | Breh      | breh@berkeley.edu | berkeley | false	|
	| name			| bro@berkeley.edu	|	berkeley | true		|

	Given I am logged in as "bro@berkeley.edu"
  And I am on the new project page
  When I fill in "title" with "My New Project"
  And I fill in "description" with "Here is the description for my project"
  And I press "Create Project"
  Then I should see "My New Project"

Scenario: see the project on the berkeley homepage

  Given I am on the Berkeley page
  Then I should see "My New Project"

Scenario: see the project on my profile page

  Then I should see "My New Project"

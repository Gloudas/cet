Feature: View all my current projects

  As an entrepreneur
  So that I can know how my projects are doing and be able to access them easily
  I want to see all my current projects on the profile page

Background: logged in user
  Given the following schools exist:
  | name      | uri      |
  | Berkeley  | berkeley |

  And the following users exist:
  | name      | email             | school   | admin 	|
  | Breh      | breh@berkeley.edu | berkeley | false	|
	| name			| bro@berkeley.edu	|	berkeley | false	|

  And the following projects exist:
  | title     | description | creator           | collaborators      |
  | Project A | p1          | bro@berkeley.edu  |                    |
  | Project B | p2          | breh@berkeley.edu | bro@berkeley.edu   |
  | Project C | p3          | breh@berkeley.edu |                    |
  | Project D | p4          | bro@berkeley.edu  | breh@berkeley.edu  |
  
	Given I am logged in as "bro@berkeley.edu"

Scenario: I should see all my active projects
  Then I should see "Project A"
  And I should see "Project B"
  And I should not see "Project C"
  And I should see "Project D"
  And I should see "1"
  And I should see "2"

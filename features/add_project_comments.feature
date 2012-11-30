Feature: View all my current projects

  As an entrepreneur
  So that I can update the public and my team members on my project
  I want to add comments to projects

Background: user is logged in
  Given the following schools exist:
  | name      | uri      |
  | Berkeley  | berkeley |

  And the following users exist:
  | name      | email             | school   | admin 	|
  | Breh      | breh@berkeley.edu | berkeley | false	|
	| name			| bro@berkeley.edu	|	berkeley | false	|

  And the following projects exist:
  | title     | description | creator           | collaborators      |
  | Project 1 | p1          | bro@berkeley.edu  |                    |
  
	Given I am logged in as "bro@berkeley.edu"

Scenario: add a comment
  Given I am on the project page for "Project 1"
  When I fill in "new_comment" with "This is a new comment."
  And I press "Comment"
  Then I should be on the project page for "Project 1"
  And I should see "This is a new comment."

Scenario: see comments in reverse chronological order
  Given I am on the project page for "Project 1"
  When I fill in "new_comment" with "Comment one"
  And I press "Comment"
  Then I should be on the project page for "Project 1"
  When I fill in "new_comment" with "Comment two"
  And I press "Comment"
  Then I should be on the project page for "Project 1"
  And I should see "Comment two" before "Comment one"


Feature: Add collaborators to a project

  As an entrepreneur
  So that I can pursue a project with others
  I want to add collaborators to a project

Background: User is logged in and has projects
  Given I am logged in as "bro@berkeley.edu"
  And I have the following projects in the database:
  | title      | description    | creator           |
  | Project 1  | p1             | bro@berkeley.edu  |
  | Project 2  | p2             | bro@berkeley.edu  |
  And I have the following users in the database:
  | name       | email             | school    |
  | Bruh       | bruh@berkeley.edu | berkeley  |
  | Breh       | breh@berkeley.edu | berkeley  |

Scenario: Successfully add collaborator to project 1
  Given I am on my profile page
  When I follow "Project 1"
  And I follow "Edit"
  And I fill in "new_collaborator" with "bruh@berkeley.edu"
  And I press "Add Collaborator"
  Then I should be on the edit project page for "Project 1"
  And I should see "Added bruh@berkeley.edu"
  And I should see "bruh@berkeley.edu"

Scenario: Fail to add inexistent collaborator to project 1
  Given I am on my profile page
  When I follow "Project 1"
  And I follow "Edit"
  And I fill in "new_collaborator" with "idontexist@berkeley.edu"
  And I press "Add Collaborator"
  Then I should be on the edit project page for "Project 1"
  And I should see "That e-mail doesn't exist!"

Scenario: Fail to add duplicate collaborator to project 2
  Given I am on my profile page
  When I follow "Project 2"
  And I follow "Edit"
  And I fill in "new_collaborator" with "bruh@berkeley.edu"
  And I press "Add Collaborator"
  Then I should be on the edit project page for "Project 2"
  When I fill in "new_collaborator" with "bruh@berkeley.edu"
  And I press "Add Collaborator"
  Then I should be on the edit project page for "Project 2"
  And I should see "That user is already a collaborator!"

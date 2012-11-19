Feature: Add collaborators to a project

  As an entrepreneur
  So that I can pursue a project with others
  I want to add collaborators to a project

Background: User is logged in and has projects

  Given the following schools exist:
  | name       | uri      |
  | Berkeley   | berkeley |

  And the following users exist:
  | name       | email             | school    | admin	|
  | Bruh       | bruh@berkeley.edu | berkeley  | false	|
  | Bro        | bro@berkeley.edu  | berkeley  | false	|

  And the following projects exist:
  | title      | description    | creator           | collaborators |
  | Project 1  | p1             | bro@berkeley.edu  |               |
  | Project 2  | p2             | bro@berkeley.edu  |               |

  And I am logged in as "bro@berkeley.edu"

Scenario: Successfully add collaborator to project 1
  When I follow "Project 1"
  And I follow "Edit Collaborators"
  And I fill in "collaborator" with "bruh@berkeley.edu"
  And I press "Add Collaborator"
  Then I should be on the edit collaborators page for "Project 1"
  And I should see "Collaborator added!"
  And I should see "Bruh"

Scenario: Fail to add inexistent collaborator to project 1
  When I follow "Project 1"
  And I follow "Edit Collaborators"
  And I fill in "collaborator" with "idontexist@berkeley.edu"
  And I press "Add Collaborator"
  Then I should be on the edit collaborators page for "Project 1"
  And I should see "Invalid collaborator!"

Scenario: Fail to add duplicate collaborator to project 2
  When I follow "Project 2"
  And I follow "Edit Collaborators"
  And I fill in "collaborator" with "bruh@berkeley.edu"
  And I press "Add Collaborator"
  Then I should be on the edit collaborators page for "Project 2"
  When I fill in "collaborator" with "bruh@berkeley.edu"
  And I press "Add Collaborator"
  Then I should be on the edit collaborators page for "Project 2"
  And I should see "Invalid collaborator!"

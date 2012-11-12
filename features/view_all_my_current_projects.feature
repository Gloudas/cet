Feature: View all my current projects

  As an entrepreneur
  So that I can know how my projects are doing and be able to access them easily
  I want to see all my current projects on the profile page

Background: logged in user
  Given that I am logged in as "bro@berkeley.edu"
  And I am on my profile page
  Given the following schools exist:
  | name      | uri      |
  | Berkeley  | berkeley |

  And the following users exist:
  | name      | email             | school   |
  | Breh      | breh@berkeley.edu | berkeley |

  And the following projects exist:
  | title     | description | creator           | collaborators      |
  | Project 1 | p1          | bro@berkeley.edu  |                    |
  | Project 2 | p2          | breh@berkeley.edu | bro@berkeley.edu   |
  | Project 3 | p3          | breh@berkeley.edu |                    |
  | Project 4 | p4          | bro@berkeley.edu  | breh@berkeley.edu  |

Scenario: I should see all my active projects
  Then I should see "Project 1"
  And I should see "Project 2"
  And I should not see "Project 3"
  And I should see "Project 4"

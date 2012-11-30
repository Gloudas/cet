Feature: Messages

  As an entrepreneur
  So that I can communicate with other entrepreneurs
  I want to be able to send and receive messages

Background: Users exist and one is logged in

  Given the following schools exist:
  | name       | uri      |
  | Berkeley   | berkeley |

  And the following users exist:
  | name       | email             | school    | admin	|
  | Bruh       | bruh@berkeley.edu | berkeley  | false	|
  | Bro        | bro@berkeley.edu  | berkeley  | false	|

  And the following projects exist:
  | title      | description    | creator           | collaborators     |
  | Project 1  | p1             | bro@berkeley.edu  |                   |

Scenario: Send a message to another user
  Given I am logged in as "bro@berkeley.edu"
  Given I am on the profile page for "bruh@berkeley.edu"
  When I follow "Send message"
  Then I should be on the messages page for "bruh@berkeley.edu"
  When I fill in "new_message" with "I really like you."
  And I press "Send"
  Then I should be on the messages page for "bruh@berkeley.edu"
  And I should see "Message sent!"
  And I should see "I really like you."

@wip
Feature: Editing Profile Page on ai2

  As a Cal Student
  So that I can display my information to others
  I want to be able to add information to my profile for others to view

Background: the student is logged into ai2

  Given the following schools exist:
  | name       | uri      |
  | Berkeley   | berkeley |

  And the following users exist:
  | name       | email             		| school    | admin		|
  | name       | bruh@berkeley.edu 		| berkeley  |	false 	|
  | admin      | admin@berkeley.edu   | berkeley  |	true 		|
  
	Given I am logged in as "bruh@berkeley.edu"

Scenario: View my profile information
  Given I am on the Berkeley page
  When I follow "Profile"
  Then I should be on the profile page
  And I should see "Name"
  And I should see "E-mail"
  And I should see "School"
  And I should see "Major"
  And I should see "About Me"
  And I should see "Graduation Year"
#And I should see "Active Projects"

Scenario: Edit my profile information (happy path)
  Given I am on my profile page
  When I follow "Edit my profile"
  Then I should be on the edit profile page
  When I fill in "About Me" with "I'm pretty chill"
  And I press "Change"
  Then I should be on my profile page
  And I should see "I'm pretty chill"

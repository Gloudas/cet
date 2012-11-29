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
  Then I should be on the profile page for "bruh@berkeley.edu"
  And I should see "Name"
  And I should see "Email"
  And I should see "School"
  And I should see "Major"
  And I should see "About Me"
  And I should see "Graduation Year"

Scenario: Edit my profile information (happy path)
  Given I am on the profile page for "bruh@berkeley.edu"
  When I follow "Edit Profile"
  Then I should be on the edit profile page for "bruh@berkeley.edu"
  When I fill in "About Me" with "I'm pretty chill"
  And I press "Update Profile"
  Then I should be on the profile page for "bruh@berkeley.edu"
  And I should see "I'm pretty chill"

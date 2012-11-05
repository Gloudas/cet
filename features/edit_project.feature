Feature: Editing Projects in ai2

	As a Cal Student
	So that I can change the direction of my project
	I want to edit my project on the ai2 site

Background: Student is logged into ai2
  Given I am logged in
	And I am on my project's page
  And I follow "Edit"
  Then I should be on my project's edit page

Scenario: Successfully edit my project
	When I fill in "title" with "Changed Project Name"
	And I fill in "description" with "My new description is chill."
  And I press "Update Project"
  Then I should be on my project's page
  And I should see "Changed Project Name"
  And I should see "My new description is chill."

Scenario: Unsuccessfully edit my project
  When I fill in "title" with ""
	And I fill in "description" with "Here is the description for my project"
  And I press "Update Project"
  Then I should be on the edit project page
  And I should see "Sorry, something went wrong with creating a new project."

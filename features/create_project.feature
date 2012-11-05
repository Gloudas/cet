Feature: Creating Projects in ai2

	As a Cal Student
	So that I can share an entrepreneurial idea
	I want to add an entrepreneur project to the Berkeley ai2 website in my name

Background: student is logged into ai2
  Given I am logged in
	And I am on the create new project page
  Then I should be on the create new project page

Scenario: Create a new project (happy path)
	When I fill in "title" with "My New Project"
	And I fill in "description" with "Here is the description for my project"
  And I press "Create Project"
  #Then I should be on the project page
  Then I should see "My New Project"
  And I should see "Here is the description for my project"

Scenario: Create a new project (sad path)
	When I fill in "description" with "Here is the description for my project"
  And I press "Create Project"
  Then I should be on the create new project page

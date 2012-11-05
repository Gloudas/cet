Feature: Creating Projects in ai2

	As a Cal Student
	So that I can share an entrepreneurial idea
	I want to add an entrepreneur project to the Berkeley ai2 website in my name

Background: student is logged into ai2
	
	Given I am on the home page

Scenario: Create a new project (happy path)
	Given I am on the create new project page
	When I fill in "Title" with "My New Project"
	And I fill in "Description" with "Here is the description for my project"
  And I press "Create Project"
	Then I should be on the "My New Project" project page
  And I should see "My New Project"
  And I should see "Here is the description for my project"
  And I should see "Bob Blabla"

Scenario: Create a new project (sad path)
	Given I am on the create new project page
	When I fill in "Description" with "Here is the description for my project"
  And I press "Create Project"
  Then I should be on the create new project page
  And the "Title" field should have the error "Field missing error"

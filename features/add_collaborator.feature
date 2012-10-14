Feature: Adding Collaborators

	As a Berkeley student
	So that I can propose an entrepreneurial project with other students
	I want to add collaborators to any projects that I propose on the ai2 website
	
	Scenario: Add a collaborator to a project
		Given I am on the home page for a project
		And I am a collaborator on the project
		When I click "Add collaborators"
		And fill in the username
		Then that user should be listed as a collaborator on the project
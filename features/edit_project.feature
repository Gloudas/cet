Feature: Editing Projects in ai2

	As an entrepreneur
	So that I can change the direction of my project
	I want to edit my project on the ai2 site


Background: Student is logged into ai2
  Given the following schools exist:
  | name       | uri      |
  | Berkeley   | berkeley |

  And the following users exist:
  | name       | email             		| school    | admin		|
  | name       | bruh@berkeley.edu 		| berkeley  |	false 	|
  | admin      | admin@berkeley.edu   | berkeley  |	true 		|
  
	Given I am logged in as "bruh@berkeley.edu"

#Given I created a project--doesn't work when put in step definitions with the steps below
#it says it can't find the path... not sure why, so I put the steps here for now
  Given I am on the new project page
  When I fill in "title" with "new proj"
  And I fill in "description" with "its pretty chill"
  And I press "Create Project"
	Given I am on my project's page
  And I follow "Edit"
  Then I should be on my project's edit page

Scenario: Successfully edit my project
	When I fill in "project_title" with "Changed Project Name"
	And I fill in "project_description" with "My new description is chill."
  And I press "Update Project"
  Then I should be on my project's page
  And I should see "Changed Project Name"
  And I should see "My new description is chill."

Scenario: Unsuccessfully edit my project
  When I fill in "project_title" with ""
	And I fill in "project_description" with "Here is the description for my project"
  And I press "Update Project"
  Then I should be on my project's edit page
  And I should see "Sorry, something went wrong with editing this project."

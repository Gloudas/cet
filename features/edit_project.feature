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
  | Bruh       | bruh@berkeley.edu 		| berkeley  |	false 	|
  | Bro        | bro@berkeley.edu     | berkeley  |	false		|

  And the following projects exist:
  | title     | description | creator           | collaborators |
  | Project 1 | p1          | bruh@berkeley.edu |               |
  
	Given I am logged in as "bruh@berkeley.edu"
  And I am on the edit project page for "Project 1"

Scenario: Successfully edit my project
	When I fill in "project_title" with "Changed Project Name"
	And I fill in "project_description" with "My new description is chill."
  And I press "Update Project"
  Then I should be on the project page for "Changed Project Name"
  And I should see "Changed Project Name"
  And I should see "My new description is chill."

Scenario: Unsuccessfully edit my project
  When I fill in "project_title" with ""
	And I fill in "project_description" with "Here is the description for my project"
  And I press "Update Project"
  Then I should be on the edit project page for "new proj"
  And I should see "Sorry, something went wrong with editing this project."

Scenario: Delete a project
  When I press "Delete Project"
  Then I should be on the Berkeley page
  And I should see "Successfully deleted Project 1"
  Given I am on the profile page for "bruh@berkeley.edu"
  Then I should not see "Project 1"

Feature: add a file to a project

  As a project collaborator
  So that I can collaborate on files with other students
  I want to upload files to and download files from a project


Background:
	Given I am on the login page
	Given the following schools exist:
	| name		| uri		|
	| Berkeley	| berkeley	|
	
	Given the following users exist:
	| name	| email				| school	| admin  |
	| test	| test@berkeley.edu	| berkeley	|  false |
	| b		| b@berkeley.edu	| berkeley	| false |
	
	Given the following projects exist:
	|title	| description	| creator			| collaborators		|
	|projA	| blahblah		| test@berkeley.edu	|					|
	|projB	| blahblah2		| b@berkeley.edu	| test@berkeley.edu |
	
	And I am logged in as "test@berkeley.edu"

Scenario: add a file to an existing project
  Given I am on my project's edit page
  When I press "Add File"
  And fill in "filename" with "text.txt"
  And I press "Upload"
  Then I should be on the project page for "ProjA"
  And I should see "test.txt"

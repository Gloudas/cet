Feature: add a file to a project

  As a project collaborator
  So that I can collaborate on files with other students
  I want to upload files to and download files from a project


Background:
	
	Given the following projects exist:
	|title	| description	| creator			|
	|projA	| blahblah		| test@berkeley.edu	|
	And the following users exist:
	|name	| email				| school	|
	|test	| test@berkeley.edu	| Berkeley	|
	
	And I am logged in as "test@berkeley.edu"

Scenario: add a file to an existing project
  When I am on the edit project page for "projA"
  And I press "Add File"
  And fill in "filename" with "text.txt"
  And I press "Upload"
  Then I should be on the project page for "ProjA"
  And I should see "test.txt"

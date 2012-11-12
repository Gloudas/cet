Feature: add a file to a project

  As a project collaborator
  So that I can collaborate on files with other students
  I want to upload files to a project


Background:
	Given I am logged in
	Given I have an active project "projA"
	Given I am a collaborator for "projA"

Scenario: add a file to an existing project
  When I am on the edit project page for "projA"
  And I press "Add File"
  And fill in "filename" with "text.txt"
  And I press "Upload"
  Then I should be on the project page for "ProjA"
  And I should see "test.txt"

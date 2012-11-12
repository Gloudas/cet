Feature: add a file to a project

  As a project collaborator
  So that I can collaborate on files with other students
  I want to upload files to a project

@wip
Scenario: add a file to an existing project
  When I go to the project page for "ProjA"
  Then I should not see "TestFile.doc"
  When I press "Upload File
  When I upload my file named "TestFile.doc"
  Then I should be on the project page for "ProjA"
  And  I should see "TestFile.doc"

Feature: add a file to a project

  As a project collaborator
  So that I can collaborate on files with other students
  I want to upload files to a project

Background: project in database

  Given the following project exists:
  | title      | collaborators  | description |
  | ProjA      | sam, jon, ken  | coolproj    |

Scenario: add a file to an existing project
  When I go to the project page for "ProjA"
  Then I should not see "TestFile.doc"
  And  I press "Upload File"
  When I upload my file named "TestFile.doc"
  Then I should be on the project page for "ProjA"
  And  I should see "TestFile.doc"
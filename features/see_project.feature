Feature: Viewing created projects

  As a student
  So that I can see projects
  I want to see my projects on my profile page and other projects on the school homepage

Background: the student is logged into the berkeley site and a project created
  
  Given I am logged in
  And I am on the new project page
  When I fill in "title" with "My New Project"
  And I fill in "description" with "Here is the description for my project"
  And I press "Create Project"
  Then I should see "My New Project"

Scenario: see the project on the berkeley homepage

  Given I am on the Berkeley page
  Then I should see "My New Project"

Scenario: see the project on my profile page

  Given I am on my profile page
  Then I should see "My New Project"
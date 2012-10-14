Feature: login to the site

  As a student entrepreneur
  So that I can access the ai2 website
  I want to login to the site with my student credentials

Background: none

Scenario: log in with a Berkeley ID
  When I am on the login page
  And I click "Login"
  Then I should be redirected to a new page
  And I should see "Login"
  When I fill in "Username" with "noelmoldvai@berkeley.edu"

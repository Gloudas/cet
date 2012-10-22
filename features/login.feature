Feature: login to the site

  As a student entrepreneur
  So that I can access the ai2 website
  I want to login to the site with my student credentials

Background:
  Given I am on the login page
  Then I should see "Login"

Scenario: log in with a Berkeley ID
  When I fill in "Username" with "noelmoldvai@berkeley.edu"
  And I click "Log in"
  Then I should be redirected to the home page
  And I should see "My Profile"

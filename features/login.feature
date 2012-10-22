Feature: login to the site

  As a student entrepreneur
  So that I can access the ai2 website
  I want to login to the site with my student credentials

Background:
  Given I am on the Berkeley page
  Then I should see "Login"
  When I follow "Login"
  Then I should be on the login page

Scenario: log in with a Berkeley ID
  When I fill in "name" with "Noeleo"
  And I fill in "email" with "noelmoldvai@berkeley.edu"
  And I press "Log in"
  Then I should be redirected to the home page
  And I should see "My Profile"

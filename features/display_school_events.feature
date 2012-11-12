Feature: Viewing upcoming events

  As a Cal Student
  So that I can participate in events with other Berkeley studetns and ai2 members
  I want to be able to view upcoming events from the Berkeley home page

Background: the student is logged into ai2

  Given I am logged in

Scenario: View my profile information
  Given I am on the Berkeley page
  Then I should see "Upcoming Events"

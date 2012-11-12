# Step definitions for CET

# Setup bullshit
require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

Given /the following project exists:/ do |fields|
  fields.rows_hash.each do |title, collaborators, description|
    Given /I am on the new project page/ do
      And %{I fill in "title" with "title"}
      And %{I fill in "description" with "description"}
      And /I press "Create Project"/
    end
  end
end

# this doesnt work because of the new project page and login page... doesn't see paths? i dunno
Given /^I created a project$/ do
  step %Q{Given I am on the new project page}
  step %Q{When I fill in "title" with "MOOHAHA"}
  step %Q{And I fill in "description" with "teyats"}
  step %Q{And I press "Create Project"}
end

# Noel adding this for login
Given /^I am logged in as "(.*)"$/ do |email|
  step %Q{Given I am on the login page}
  step %Q{When I fill in "name" with "admin"}
  step %Q{And I fill in "email" with email}
  step %Q{And I click "Sign In"}
end

# for selecting login
Capybara.add_selector(:element) do
  xpath { |locator| "//*[normalize-space(text())=#{XPath::Expression::StringLiteral.new(locator)}]" }
end

#class Capybara::XPath
#  class << self
#   def element(locator)
#     append("//*[normalize-space(text())=#{s(locator)}]")
#   end
# end
#end

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

When /^I click "(.*)"$/ do |locator|
  #msg = "No element could be found BITCH"
  #locate(:xpath, Capybara::XPath.element(locator), msg).click
  find(:xpath, XPath::HTML.content(locator)).click
end    

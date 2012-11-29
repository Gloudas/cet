# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      home_path

    when /^the login page$/
      login_path

    when /^the Berkeley page$/
      school_path('berkeley')

    when /^the Events page$/
      events_path('berkeley')

    when /^the new project page$/
      new_project_path

    when /^my project's page$/
      project_path(1)

    when /^my project's edit page$/
      edit_project_path(1)

    when /^the edit collaborators page/
      ans = /^the edit collaborators page for "(?<name>.*)"$/.match(page_name)
      p = Project.find_by_title(ans[:name])
      edit_collaborators_path(p.id)

    when /^"(.*)"$/
      page_name

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)

def createProject title, description
    Project.create!({:title => title, :description => description, :status => 'open', :nice_url => escape(title.downcase)})
end

Given /^I have (\d+) projects?$/ do |count|
    projects = Project.all
    projects.size.should == count.to_i
end

Given /^I have a project named '([^\']*)' described as '([^\']*)'$/ do |title, description|
    createProject title, description
end

Given /^I have a project named '([^\']*)'$/ do |title|
    createProject title, 'Some description'
end

Given /^I fill in '(.*)' for '(.*)'$/ do |value, field|
    fill_in(field, :with => value)
end

When /^I press '(.*)'$/ do |name|
    click_button(name)
end

Then /^I should see '(.*)'$/ do |text|
   body.should match text.strip 
end

When /^I follow '(.*)'$/ do |link|
    click_link(link)
end

Then /^I should have (\d+) projects?$/ do |count|
    Project.all.size.should == count.to_i
end

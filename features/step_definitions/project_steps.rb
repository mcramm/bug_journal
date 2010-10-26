Given /^I have (\d+) projects?$/ do |count|
    projects = Project.all
    projects.size.should == count.to_i
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

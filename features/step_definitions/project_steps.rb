Given /^I have (\d+) projects?$/ do |count|
    projects = Project.all
    projects.size.should == count.to_i
end

Given /^I am logged in$/ do
    visit path_to('the home page')
    fill_in('username', :with => 'user')
    fill_in('password', :with => 'test')
    click_button('submit')
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

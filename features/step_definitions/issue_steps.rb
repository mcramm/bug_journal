Given /^I have (\d+) issues?$/ do |count|
    Project.first.issues.size.should == count.to_i
end

Given /^I have a project named '(.*)'$/ do |title|
    Project.create!({:title => title, :description => 'Saucy', :status => 'open'})
end

Then /^I should have (\d+) issues?$/ do |count|
    Project.first.issues.size.should == count.to_i
end

Then /^I should not see '(.*)'$/ do |text|
    body.should_not match text.strip
end

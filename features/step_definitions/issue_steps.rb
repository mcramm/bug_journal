Given /^I have (\d+) issues?$/ do |count|
    Project.first.issues.size.should == count.to_i
end

# Move this to the project steps
Given /^I have a project named '(.*)'$/ do |title|
    Project.create!({:title => title, :description => 'Saucy', :status => 'open', :nice_url => escape(title.downcase)})
end

Given /^I have a project, '(.*)', with an issue, '(.*)'$/ do |project_title, issue_title|
    # DRY this line
    project = Project.create!({:title => project_title, :description => 'Saucy', :status => 'open', :nice_url => escape(project_title.downcase)})
    issue = Issue.new({:title => issue_title, :description => 'Not Enough!', :status => 'open'})

    project.issues << issue
    project.save
end



Then /^I should have (\d+) issues?$/ do |count|
    Project.first.issues.size.should == count.to_i
end

Then /^I should not see '(.*)'$/ do |text|
    body.should_not match text.strip
end

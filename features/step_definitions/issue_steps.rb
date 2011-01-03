def createIssue title
    Issue.new({:title => title, :description => 'Not Enough!', :status => 'open'})
end

Given /^I have (\d+) issues?$/ do |count|
    Project.first.issues.size.should == count.to_i
end

Given /^I have a project, '(.*)', with an issue, '(.*)'$/ do |project_title, issue_title|
    project = createProject project_title, 'Some description'
    issue = createIssue issue_title

    project.issues << issue
    project.save
end

Then /^I should have (\d+) issues?$/ do |count|
    Project.first.issues.size.should == count.to_i
end

Then /^I should not see '(.*)'$/ do |text|
    body.should_not match text.strip
end

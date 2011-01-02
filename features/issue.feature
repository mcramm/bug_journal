Feature: Issues
    In order for a project to have issues
    As a user
    I want to be able to add/edit and delete issues

        Scenario: Add Issue
            Given I have a project named 'Pizza'
            And I have 0 issues
            And I am logged in
            And I am on the home page
            And I follow 'Pizza'
            When I follow 'Add Issue'
            And I fill in 'Pepperoni' for 'title'
            And I fill in 'Not Enough!' for 'description'
            And I press 'Save'
            Then I should see 'Pepperoni'
            And I should have 1 issue

        Scenario: View Issue
            Given: I have 1 project
            And I have 1 issue
            And I am logged in
            And I am on the home page
            And I follow 'Pizza'
            When I follow 'Pepperoni'
            Then I should see 'Pepperoni'
            And I should see 'Not Enough!'

        Scenario: Edit Issue
            Given: I have 1 project
            And I have 1 issue
            And I am logged in
            And I am on the home page
            And I follow 'Pizza'
            And I follow 'Pepperoni'
            When I follow 'Edit'
            And I fill in 'Crust' for 'title'
            And I fill in 'Too Cheesey!' for 'description'
            And I press 'Save'
            Then I should see 'Crust'
            And I should have 1 issue

        Scenario: Delete Issue
            Given: I have 1 project
            And I have 1 issue
            And I am logged in
            And I am on the home page
            And I follow 'Pizza'
            And I follow 'Crust'
            When I follow 'Delete'
            Then I should not see 'Crust'
            And I have 0 issues

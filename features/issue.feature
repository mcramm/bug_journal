Feature: Issues
    In order for a project to have issues
    As a user
    I want to be able to add/edit and delete issues

        Scenario: Add Issue
            Given I have a project named 'Pizza'
            And I have 0 issues
            And I am viewing the 'Pizza' project page
            When I follow 'Add Issue'
            And I fill in 'Pepperoni' for 'title'
            And I fill in 'Not Enough!' for 'description'
            And I press 'Save'
            Then I should see 'Pepperoni'
            And I should have 1 issue

        Scenario: View Issue
            Given I have a project, 'Pizza', with an issue, 'Pepperoni'
            When I am viewing the 'Pizza'=>'Pepperoni' issue page
            Then I should see 'Pepperoni'
            And I should see 'Not Enough!'

        Scenario: Edit Issue
            Given I have a project, 'Pizza', with an issue, 'Pepperoni'
            And I am viewing the 'Pizza'=>'Pepperoni' issue page
            When I follow 'Edit'
            And I fill in 'Crust' for 'title'
            And I fill in 'Too Cheesey!' for 'description'
            And I press 'Save'
            Then I should see 'Crust'
            And I should have 1 issue

        Scenario: Delete Issue
            Given I have a project, 'Pizza', with an issue, 'Pepperoni'
            And I am viewing the 'Pizza'=>'Pepperoni' issue page
            When I follow 'Delete'
            Then I should not see 'Pepperoni'
            And I have 0 issues

        Scenario: Add Issue For Project With Spaces
            Given I have a project named 'Pizza Party'
            And I have 0 issues
            And I am viewing the 'Pizza Party' project page
            When I follow 'Add Issue'
            And I fill in 'Double Pepperoni' for 'title'
            And I fill in 'Not Enough!' for 'description'
            And I press 'Save'
            Then I should see 'Double Pepperoni'
            And I should have 1 issue

        Scenario: Edit Issue For Project With Spaces
            Given I have a project, 'Pizza Party', with an issue, 'Pepperoni'
            And I am viewing the 'Pizza Party'=>'Pepperoni' issue page
            When I follow 'Edit'
            And I fill in 'Crust' for 'title'
            And I fill in 'Too Cheesey!' for 'description'
            And I press 'Save'
            Then I should see 'Crust'
            And I should have 1 issue

        Scenario: Delete Issue For Project With Spaces
            Given I have a project, 'Pizza Party', with an issue, 'Pepperoni'
            And I am viewing the 'Pizza Party'=>'Pepperoni' issue page
            When I follow 'Delete'
            Then I should not see 'Pepperoni'
            And I have 0 issues


Feature: Projects
    In order to have projects
    As a user
    I want to be able to add, edit and delete projects

    Scenario: Add Project
        Given I have 0 projects
        And I am logged in
        And I am on the new_project page
        And I fill in 'Pizza' for 'title'
        And I fill in 'Saucy' for 'description'
        When I press 'Save'
        Then I should see 'Pizza'
        And I should see 'Saucy'
    
    Scenario: View Project List
        Given I have a project named 'Pizza'
        And I am viewing the user home page
        Then I should see 'Pizza'

    Scenario: View Project
        Given I have a project named 'Pizza' described as 'Saucy'
        And I am viewing the user home page
        When I follow 'Pizza'
        Then I should see 'Pizza'
        And I should see 'Saucy'

    Scenario: Edit Project
        Given I have a project named 'Pizza'
        And I am viewing the user home page
        When I follow 'Pizza'
        And I follow 'Edit'
        And I fill in 'Hamburger' for 'title'
        And I fill in 'Cheesey' for 'description'
        And I press 'Save'
        Then I should see 'Hamburger'
        And I should see 'Cheesey'
        And I should have 1 project

    Scenario: Delete Project
        Given I have a project named 'Pizza'
        And I am viewing the user home page
        When I follow 'Pizza'
        And I follow 'Delete'
        Then I should be on the home page
        And I should have 0 projects

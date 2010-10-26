Feature: Projects
    In order to have projects
    As a user
    I want to be able to add, edit and delete projects

    Scenario: Add Project
        Given I have 0 projects
        And I am on the new_project page
        And I fill in 'Pizza' for 'title'
        And I fill in 'Saucy' for 'description'
        When I press 'Save'
        Then I should see 'Pizza'
        And I should see 'Saucy'
    
    Scenario: View Project List
        Given I have 1 project
        When I am on the home page
        Then I should see 'Pizza'

    Scenario: View Project
        Given I have 1 project
        And I am on the home page
        When I follow 'Pizza'
        Then I should see 'Pizza'
        And I should see 'Saucy'

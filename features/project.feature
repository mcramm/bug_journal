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

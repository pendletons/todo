Feature: Categories
  In order to organise to-do lists, users should be able to have categories

  Scenario: List categories
    Given I am logged in
      And there are 2 categories
    When I go to the categories page
    Then I see both categories

  Scenario: Default categories
    Given I am logged in
    When I go to the categories page
    Then I see my default categories

  Scenario: Create category
    Given I am logged in
    When I add a category
      And I go to the categories page
    Then I should see my new category
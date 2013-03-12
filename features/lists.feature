Feature: Lists
  Users should be able to have lists with items

  Scenario: List lists
    Given I am logged in
      And there are 2 lists
    When I go to the lists page
    Then I see both lists

  Scenario: Create list with 1 item
    Given I am logged in
    When I add a list with 1 item
      And I go to the lists page
      And I click on my list
    Then I should see my new list with 1 item

  Scenario: Create list with 2 items
    Given I am logged in
    When I add a list with 2 items
      And I go to the lists page
      And I click on my list
    Then I should see my new list with 2 items

  Scenario: View list with completed items
    Given I am logged in
    When I add a list with 2 items
      And 1 list item is complete
      And I go to the lists page
      And I click on my list
    Then I should see my completed item
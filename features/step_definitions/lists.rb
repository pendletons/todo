Given(/^there are (\d+) lists$/) do |number|
  number.to_i.times { |i|
    item = Item.new(name: 'Item 1')

    l = List.new
    l.category_id = @user.categories.first.id
    l.name = "List #{i}"
    l.items << item
    l.save
  }
end

When(/^I go to the lists page$/) do
  visit '/lists'
end

Then(/^I see both lists$/) do
  page.should have_content "List 0"
  page.should have_content "List 1"
end

When(/^I add a list with 1 item$/) do
  visit '/lists/new'
  page.select 'Home', from: 'list_category_id'
  page.fill_in 'list_name', with: 'New List'
  page.fill_in 'list_items_attributes_0_name', with: 'Item 1'
  click_button "Create List"
end

When(/^I add a list with 2 items$/) do
  visit '/lists/new'
  page.select 'Home', from: 'list_category_id'
  page.fill_in 'list_name', with: 'New List'
  page.fill_in 'list_items_attributes_0_name', with: 'Item 1'
  page.fill_in 'list_items_attributes_1_name', with: 'Item 2'
  click_button "Create List"
end

When(/^I click on my list$/) do
  click_link('New List')
end

Then(/^I should see my new list with 1 item$/) do
  page.should have_content "New List"
  page.should have_content "Item 1"
  page.should_not have_content "Item 2"
end

Then(/^I should see my new list with 2 items$/) do
  page.should have_content "New List"
  page.should have_content "Item 1"
  page.should have_content "Item 2"
end
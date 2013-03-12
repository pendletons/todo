Given(/^there are (\d+) categories$/) do |number|
  number.to_i.times { |i|
    c = Category.new
    c.user_id = @user.id
    c.name = "Category #{i}"
    c.save
  }
end

When(/^I go to the categories page$/) do
  visit '/categories'
end

Then(/^I see both categories$/) do
  page.should have_content "Category 0"
  page.should have_content "Category 1"
end

When(/^I add a category$/) do
  visit '/categories/new'
  fill_in "category_name", :with => 'Foo'
  click_button "Create Category"
end

Then(/^I should see my new category$/) do
  page.should have_content "Foo"
end

Then(/^I see my default categories$/) do
  page.should have_content "Home"
  page.should have_content "Work"
end
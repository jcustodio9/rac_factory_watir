Given(/^I navigate to RAC home page$/) do
  visit(HomePage)
end

When(/^I click on the navigation menu:$/) do |table|
  sleep 1
  on Navigation do |page|
    page.click_on_navigation_level_1 table
  end  
end

When(/^I click on the navigation submenu:$/) do |table|
  sleep 1
  on Navigation do |page|
    page.click_on_navigation_level_2 table
  end  
end

When(/^I click on the navigation link:$/) do |table|
  sleep 1
  on Navigation do |page|
    page.click_on_navigation_level_3 table
  end  
end

When(/^I click on the navigation sublink:$/) do |table|
  sleep 1
  on Navigation do |page|
    page.click_on_navigation_level_4 table
  end  
end



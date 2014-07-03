Given(/^I am on home page$/) do
   visit "/"
end

Then(/^I should have title$/) do

end

When /^I search for "(.*)"$/ do |sear|
   page.find('#searchBox-1').set sear
  page.find('#searchBtn').click
end

Then /^I should be on search results page$/ do
      page.should have_css('.productLists')
end
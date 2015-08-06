When(/^she retrieves the page "([^"]+)"$/) do |url|
  visit "#{BASE}#{url}"
end

When(/^she enters "([^"]*)" in the "([^"]+)" field$/) do |text, field|
  fill_in(field, :with => text)
end

When(/^she selects "([^"]*)" from the "([^"]+)" dropdown$/) do |option, dropdown|
  select(option, :from => dropdown)
end

When(/^she clicks on the "(.*)" link$/) do |link|
  click_link(link)
end

When(/^she clicks on the "(.+)" button$/) do |button|
  click_on(button)
end

When(/^she clicks on the first "(.+)" button$/) do |button_text|
  buttons = all(:xpath, "//a[normalize-space(.) = '#{button_text}']")
  buttons[0].click
end

When(/^she clicks on the "(.+)" checkbox$/) do |box|
  uncheck(box)
end

When(/^she checks the "(.+)" checkbox$/) do |box|
  check(box)
end

When(/^she chooses the "(.+)" radio button$/) do |button|
  choose(button)
end

When(/^she clicks on the "([^"]+)" text$/) do |text|
  find(:xpath, "//*[text()='#{text}']").click
end

Then(/^she should retrieve a web page$/) do 
end

Then(/^she should retrieve a "([^"]+)" file$/) do |mime_type|
  puts page.response_headers['Content-Type']
  expect(page.response_headers['Content-Type']).to match(Regexp.new(mime_type))
end

Then(/^it should have the title "(.*)"$/) do |title|
  expect(page.title).to match(Regexp.new("\\s*#{title}\\s*"))
end

Then(/^it should have content "(.*)"$/) do |content|
  expect(page).to have_content content
end

Then(/^it should have a link "(.*)"$/) do |link|
  expect(page).to have_link link
end

Then(/^it should have link text "(.*)" with link ending with "(.*)"$/) do |link_text, ending|
  element = find_link(link_text)
  href=element['href']
  expect(href.split('?')[0]).to end_with(ending)
end

   



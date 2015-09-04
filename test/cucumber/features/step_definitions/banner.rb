
Then(/^it should have the Companies House Linked Data Viewer banner$/) do
  expect(page).to have_xpath("/html/body/nav/div/div[@class='navbar-header']")
  expect(page).to have_xpath("/html/body/nav/div/div[@class='navbar-header']/div[@class='header-logo']/a[@href='http://www.companieshouse.gov.uk']/span[contains(text(), 'Companies House')]")
  expect(page).to have_xpath("/html/body/nav/div/div[contains(@class,'navbar-collapse')]//a[contains(text(), 'Linked Data Service')]")
end


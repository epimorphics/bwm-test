
Then(/^it should have outer resources$/) do
#  expect(page).to have_xpath("//body/div[@class='container']/container/section/[@class='rdf resource outer']")
#  outer_resource = find(:xpath, "//body/div[@class='container']/section[@class='rdf resource outer']")
  outer_resources = all("section.resource.outer")
  expect(outer_resources.size).not_to be(0)
  @@world[:outer_resources] = outer_resources
end

Then(/^each outer resource should have a property named '(.*)'$/) do | prop_name |
  @@world[:outer_resources].each do | resource |
    prop_elements = resource.all(:xpath, "div//div[@class='rdf predicate']/a[text() = '#{prop_name}' ]")
    expect(prop_elements.size).not_to be(0)
  end
end 
  


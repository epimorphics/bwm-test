
Then(/^it should have outer resources$/) do
  outer_resources = all("section.resource.outer")
  expect(outer_resources.size).not_to be(0)
  @world[:outer_resources] = outer_resources
end

Then(/^it should have one outer resource$/) do
  outer_resources = all("section.resource.outer")
  expect(outer_resources.size).to be(1)
  @world[:outer_resource] = outer_resources[0]
end

Then(/^each outer resource should have a property named '(.*)'$/) do | prop_name |
  @world[:outer_resources].each do | resource |
    prop_elements = resource.all(:xpath, "div//div[@class='rdf predicate']/a[text() = '#{prop_name}' ]")
    expect(prop_elements.size).not_to be(0)
  end
end 

Then(/^that outer resource should have a type named '(.*)'$/) do | class_name |
  resource = @world[:outer_resource]
  resource_labels = resource.all(:xpath, "div/div[@class='resource-types']//text()[normalize-space(.)='#{class_name}']")
end

Then(/^that outer resource should have a label '(.*)'$/) do | label |
  resource = @world[:outer_resource]
  label_elements = resource.all(:xpath, "div/div/h1[@class='resource-label']")
  expect(label_elements.size).to eq(1)
  expect(label_elements[0].text().include?('Registered company')).to be(true)
  
end

Then(/^that outer resource should have a property named '(.*)' with literal value '(.*)'$/) do | property_name, value |
  resource = @world[:outer_resource]
  prop_elements = resource.all(:xpath, "div/div/ul/div/div/li/div/div[@class='rdf predicate']/a[normalize-space(.)='#{property_name}']")
  expect(prop_elements.size).not_to be(0) 
  value_elements = resource.all(:xpath, "div/div/ul/div/div/li/div/div[@class='rdf object literal'][normalize-space(.)='#{value}']")
  expect(value_elements.size).not_to be(0)
end

Then(/^that outer resource should have a property named "sub class of' with a resource value named 'Registered Organization'$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

  


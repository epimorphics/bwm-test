#
# definitions for the output of the elda default velocity renderer
#
# the xpath expressions are too specific to the particular html
# hierarchy in use.  There is definitely room for improvement
# but may require extra classes or attributes on the html to help
#
# the xpath expressions are horribly complex also.
# a possible approach would be to compile the expressions with a
# structure similar to the velocity code that generates the html
#

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
  property_elements = get_property_elements(resource, property_name);
  expect(property_elements.size).to be(1) 
  value_elements = get_literal_object_elements(property_elements[0], value)
  expect(value_elements.size).to be(1)
end

Then(/^that outer resource should have a property named '(.*)' with a resource value named '(.*)'$/) do | property_name, value_name |
  resource = @world[:outer_resource]
  property_elements = get_property_elements(resource, property_name);
  expect(property_elements.size).to be(1)
  value_elements = get_resource_object_elements(property_elements[0], value_name)
  expect(value_elements.size).to be(1)
end

# return an array of the base property elements for a property of the resource element
def get_property_elements(resource_element, property_name)
  resource_element.all(:xpath, "div/div/ul/div/div/li/div/div[@class='rdf predicate']/a[normalize-space(.)='#{property_name}']/../../..")
end  

# return an array of the literal object elements with a given value
def get_literal_object_elements(property_element, value)
  property_element.all(:xpath, "div/div[contains(@class, 'rdf') and contains(@class, 'object') and contains(@class, 'literal')][normalize-space(.)='#{value}']");
end

# return an array of the resource object elements with a given label
def get_resource_object_elements(property_element, value_name)
  # limit the depth we search to include only the shallowest child resource
  # this is so crude - there must be a better way to do it.
  depth = property_element.native.ancestors.size
  property_element.all(:xpath, "div//div[count(ancestor::*)<#{depth.to_s}+5][contains(@class, 'rdf') and contains(@class, 'resource') and contains(@class, 'nested')]/div/*[@class='resource-label'][normalize-space(.)='#{value_name}']")
end


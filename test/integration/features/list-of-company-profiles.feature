Feature: list of company profiles

	As visitor

	I want to see a list of companies and their properties
	
    .

	Scenario:
		Given a visitor
		When she retrieves the page "/company-profile/company"
		Then she should retrieve a web page
		And  it should have the title "/company-profile/company.html – page 0"
        And  it should have the Companies House Linked Data Viewer banner
        And it should have outer resources
        And each outer resource should have a property named 'country of origin'   
        And each outer resource should have a property named 'identifier'   
        And each outer resource should have a property named 'incorporation date'   
        And each outer resource should have a property named 'legal name'   
        And each outer resource should have a property named 'notation'   
        And each outer resource should have a property named 'pref label'   
        And each outer resource should have a property named 'accounts schedule'
        And each outer resource should have a property named 'org status'   
        And each outer resource should have a property named 'org type'   
        And each outer resource should have a property named 'registered address'   
        And each outer resource should have a property named 'registration'   
        And each outer resource should have a property named 'returns schedule'       
	
Feature: list of company profiles

	As a data user

	I want to see the description of a vocabulary term when I dereference its URI
	
    .

	Scenario:
		Given a visitor
		When she retrieves the page "/company-profile/def/company-terms/RegisteredCompany"
		Then she should retrieve a web page
		And  it should have the title ">LDA resource at /company-profile/def/company-terms/RegisteredCompany.htm"
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
	
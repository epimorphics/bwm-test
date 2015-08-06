Feature: list of company profiles

	As a data user

	I want to see the description of a vocabulary term when I dereference its URI
	
    .

	Scenario:
		Given a visitor
		When she retrieves the page "/company-profile/def/company-terms/RegisteredCompany"
		Then she should retrieve a web page
		And  it should have the title "LDA resource at /company-profile/def/company-terms/RegisteredCompany.html"
        And  it should have the Companies House Linked Data Viewer banner
        And it should have one outer resource
        And that outer resource should have a label 'Registered company'
        And that outer resource should have a type named 'Class'  
        And that outer resource should have a property named 'label' with literal value 'Registered company'
        And that outer resource should have a property named 'pref label' with literal value 'Registered company'
        And that outer resource should have a property named "sub class of' with a resource value named 'Registered Organization'
	
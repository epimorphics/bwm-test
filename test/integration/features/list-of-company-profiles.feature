Feature: list of company profiles

	As visitor

	I want to see a list of companies
	
    .

	Scenario:
		Given a visitor
		When she retrieves the page "/company-profile/company"
		Then she should retrieve a web page
		And  it should have the title "/company-profile/company.html – page 0"
        And  it should have the Companies House Linked Data Viewer banner
        
	
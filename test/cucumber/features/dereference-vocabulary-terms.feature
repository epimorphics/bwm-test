@LEVEL-1
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
        And that outer resource should have a label "Registered company"
        And that outer resource should have a type named "Class"  
        And that outer resource should have a property named "label" with literal value "Registered company"
        And that outer resource should have a property named "pref label" with literal value "Registered company"
        And that outer resource should have a property named "sub class of" with a resource value named "Registered Organization"
        
    Scenario:
        Given a visitor
        When she retrieves the page "/company-profile/company"
        And she clicks on the first "accounts schedule" link
        Then she should retrieve a web page
        And it should have the title "LDA resource at /company-profile/def/company-terms/accountsSchedule.html"
        And it should have the Companies House Linked Data Viewer banner
        And it should have one outer resource
        And that outer resource should have a label "accounts schedule"
        And that outer resource should have a type named "Object Property"
        And that outer resource should have a property named "label" with literal value "accounts schedule"
        And that outer resource should have a property named "domain" with a resource value named "registered company"
        And that outer resource should have a property named "range" with a resource value named "accounts schedule"
        
    Scenario:
        Given a visitor
        When she retrieves the page "/company-profile/def/sic-2007/74202"
        Then she should retrieve a web page
        And it should have the title "LDA resource at /company-profile/def/sic-2007/74202.html"
        And it should have the Companies House Linked Data Viewer banner
        And it should have one outer resource
        And that outer resource should have a label "Other specialist photography (not including portrait photography)"
        And that outer resource should have a type named "code point"
        And that outer resource should have a type named "sub class"
        And that outer resource should have a property named "condensed notation" with literal value "74202"
        And that outer resource should have a property named "notation" with literal value "74202"
        And that outer resource should have a property named "notation" with literal value "74.20/2"
        And that outer resource should have a property named "pref label" with literal value "Other specialist photography (not including portrait photography)"
        And that outer resource should have a property named "broader" with a resource value named "Photographic activities"
        And that outer resource should have a property named "in scheme" with a resource value named "scheme"
 
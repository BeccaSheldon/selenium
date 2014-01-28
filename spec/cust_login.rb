
require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations


describe "Login as a Contributor" do

	before(:each) do
		@driver = Selenium::WebDriver.for :firefox
		@base_url = "http://crowdflower.com/"
		@accept_next_alert = true
		@driver.manage.timeouts.implicit_wait = 30
		@verification_errors = []
  end
  
  after(:each) do
    @driver.quit
    @verification_errors.should == []
  end
  
  it "cust_login_test" do
    @driver.get "http://crowdflower.com/"
    (@driver.title).should == "CrowdFlower | The World's Leading Crowdsourcing Service."
    @driver.find_element(:link, "Login").click
  end

end

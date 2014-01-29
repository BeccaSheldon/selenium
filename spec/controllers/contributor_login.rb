
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
  
  it "tests if Contributors can login to dashboard" do
    @driver.get "https://id.crowdflower.com/session/new?redirect_url=https%3A%2F%2Fcrowdflower.com%2Fjobs&app=make"
    (@driver.title).should == "CrowdFlower"
    @driver.find_element(:link, "Sign In as a Contributor").click
    (@driver.title).should == "New Logins — Tasks by CrowdFlower"
    @driver.find_element(:id, "auth_central_login_username").clear
    @driver.find_element(:id, "auth_central_login_username").send_keys "rebecca.sheldon@crowdflower.com"
    @driver.find_element(:id, "auth_central_login_password").clear
    @driver.find_element(:id, "auth_central_login_password").send_keys "JoliPop0p"
    @driver.find_element(:name, "button").click
    # ERROR: Caught exception [ERROR: Unsupported command [selectWindow | name=_dashboard | ]]
    (@driver.title).should == "Show Dashboard — Tasks by CrowdFlower"
  end

end

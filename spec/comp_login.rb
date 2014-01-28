require "json"
require "selenium-webdriver"
require "rspec"
include RSpec::Expectations

describe "Login as a Customer" do

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
  
  it "comp_login_test" do
    @driver.get "http://crowdflower.com/"
    (@driver.title).should == "CrowdFlower | The World's Leading Crowdsourcing Service."
    @driver.find_element(:link, "Login").click
  end
  
  def element_present?(how, what)
    receiver.find_element(how, what)
    true
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end
  
  def alert_present?()
    receiver.switch_to.alert
    true
  rescue Selenium::WebDriver::Error::NoAlertPresentError
    false
  end
  
  def verify(&blk)
    yield
  rescue ExpectationNotMetError => ex
    @verification_errors << ex
  end
  
  def close_alert_and_get_its_text(how, what)
    alert = receiver.switch_to().alert()
    alert_text = alert.text
    if (@accept_next_alert) then
      alert.accept()
    else
      alert.dismiss()
    end
    alert_text
  ensure
    @accept_next_alert = true
  end
end
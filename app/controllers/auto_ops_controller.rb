class AutoOpsController < ApplicationController

  def login
  	require 'selenium-webdriver'

	# Open Firefox
	driver = Selenium::WebDriver.for :firefox

	# Go to CrowdFlower.com
	driver.navigate.to "http://www.crowdflower.com" 

	# Move mouse to div containing login link
	driver.find_element(:id => "mainHeader").click
	# driver.find_element(:id => "upperNav").click

	# Problem selecting actual link!!!!
	driver.find_element(:css => "#upperNav a").click

	# Quit Firefox
	driver.quit
  end

  def make_job
  	require 'selenium-webdriver'

	# Open Firefox
	driver = Selenium::WebDriver.for :firefox

	# Go to CrowdFlower.com
	driver.navigate.to "http://www.crowdflower.com" 

	# Quit Firefox
	driver.quit
  end
end

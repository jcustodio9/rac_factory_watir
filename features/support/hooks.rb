require 'watir-webdriver'
require 'watir-webdriver-performance'
require 'webdriver-user-agent'
require 'watir-webdriver/wait'
require 'selenium/server'
require 'rubygems'

#define the browser object based on the command line input
case ENV['BROWSER']
	when "iphone","ipad","android_phone","android_tablet" then
		driver = Webdriver::UserAgent.driver(:browser => :chrome, :agent => :ENV['BROWSER'], :orientation => :portrait)
		browser = Watir::Browser.new driver
		browser.window.move_to(0, 0)

		if ENV['BROWSER'].match /iphone/i
			browser.window.resize_to 320, 568 #approximate iphone size
		elsif ENV['BROWSER'].match /ipad/i
			browser.window.resize_to 768, 1024 #approzimate ipad size
		elsif ENV['BROWSER'].match /android_tablet/i
			browser.window.resize_to 600, 960 #approximate nexus 7 size
		else
			browser.window.resize_to 360, 598 #approximate nexus 5 size
		end		

	when "firefox" then
		caps = Selenium::WebDriver::Remote::Capabilities.firefox
		caps.version = "30"
		caps.native_events = false
		caps.javascript_enabled= true

		# This is for increasing the default timeout to 180
		client = Selenium::WebDriver::Remote::Http::Default.new
		client.timeout = 300

		browser = Watir::Browser.new ENV['BROWSER']
		browser.driver.manage.window.maximize

	when "chrome" then
		caps = Selenium::WebDriver::Remote::Capabilities.chrome
		caps.version = "41.0.2272.118 m"
		caps.native_events = false
		caps.javascript_enabled= true

		# This is for increasing the default timeout to 180
		client = Selenium::WebDriver::Remote::Http::Default.new
		client.timeout = 180
		
		browser = Watir::Browser.new ENV['BROWSER']
		browser.driver.manage.window.maximize
end

#before each scenario set the browser object to the one defined
Before do
    browser.cookies.clear
	@browser = browser

end

After do |scenario|
	unless ENV["BROWSER"].eql? "ie"
		#if scenario.failed?
		#	filename = "error-#{@current_page.class}-#{Time.now}.png"
		#	@current_page.save_screenshot(filename)
		#	embed(filename, 'image/png')
		#end
		#browser.close

		load_response_time = @browser.performance.summary[:response_time]/1000
		load_first_byte = @browser.performance.summary[:time_to_first_byte]/1000
		load_last_byte = @browser.performance.summary[:time_to_last_byte]/1000
		load_redirect_count = @browser.performance.navigation[:redirect_count]/1000
  		load_total_heap_size = @browser.performance.memory[:total_js_heap_size]/1000
  		load_used_heap_size = @browser.performance.memory[:total_js_heap_size]/1000
  		load_response_start = @browser.performance.timing[:response_start]/1000
  		load_response_end = @browser.performance.timing[:response_end]/1000
  		load_event_start = @browser.performance.timing[:load_event_start]/1000
  		load_event_end = @browser.performance.timing[:unload_event_end]/1000

  		puts "Response Time: #{load_response_time} seconds."
  		puts "Time to First Byte: #{load_first_byte} seconds."
  		puts "Time to Last Byte: #{load_last_byte} seconds."
  		puts "Redirect Count: #{load_redirect_count} seconds."
  		puts "Total Heap Size: #{load_total_heap_size} seconds."
  		puts "Used Heap Size: #{load_used_heap_size} seconds."
  		puts "Connect Start: #{load_response_start} seconds."
  		puts "Connect End: #{load_response_end} seconds."
  		puts "Load Event Start: #{load_event_start} seconds."
  		puts "Unload Event End: #{load_event_end} seconds."
		sleep 2
	end
end



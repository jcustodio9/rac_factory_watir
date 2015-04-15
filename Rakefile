require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'


BROWSER = ENV['BROWSER']
URL = ENV['URL']

time = Time.now.strftime("%Y%m%d%H%M%S")
FOLDER="reports\\#{time}"
FileUtils.mkdir_p FOLDER

ENV['Screen_Short_FOLDER'] = FOLDER
html_report_location = "#{FOLDER}\\test_report.html"
xml_report_location = "build\\test_report.xml"

Cucumber::Rake::Task.new(:travel_insurance_quote) do |t|
  t.cucumber_opts = "--tags=@travel_insurance_quote --format progress --format html --format junit --out " + xml_report_location #+ " --out " + html_report_location
end
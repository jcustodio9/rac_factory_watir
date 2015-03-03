require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

BROWSER = ENV['BROWSER']
URL = ENV['URL']

Cucumber::Rake::Task.new(:travel_insurance_quote) do |t|
  t.cucumber_opts = "--tags=@travel_insurance_quote --format progress --format html --o "
end
When(/^I should see the Travel insurance page$/) do
  on TravelInsurancePage do |page| 
    page.verify_travel_insurance_page
  end 
end

When(/^I select Area of Travel: (.*?)$/) do |destination|
  on TravelInsurancePage do |page| 
    page.select_destination destination
  end 
end

When(/^I select Primary Country: (.*?)$/) do |country|
  on TravelInsurancePage do |page| 
    page.select_country country
  end 
end

When(/^I select Departure Date: (.*?) Month: (.*?) Year: (.*?)$/) do |departure_date,departure_month,departure_year|
  on TravelInsurancePage do |page| 
    page.pick_departure_date departure_date,departure_month,departure_year
  end 
end

When(/^I select Return Date: (.*?) Month: (.*?) Year: (.*?)$/) do |return_date,return_month,return_year|
  on TravelInsurancePage do |page| 
    page.pick_return_date return_date,return_month,return_year
  end 
end

When(/^I enter Traveller's Age: (.*?) (.*?)$/) do |traveller_1,traveller_2|
  on TravelInsurancePage do |page|
    page.enter_travellers_ages traveller_1,traveller_2
  end  
end

When(/^I select number of accompanied children: (.*?)$/) do |children|
  on TravelInsurancePage do |page|
    page.select_accompanied_children children
  end  
end

When(/^I select if resident: (.*?)$/) do |resident|
  on TravelInsurancePage do |page|
    page.is_resident resident
  end  
end

When(/^I select RAC membership: (.*?)$/) do |membership|
  on TravelInsurancePage do |page|
    page.is_rac_member membership
  end  
end

When(/^I select if has pre-existing condition: (.*?)$/) do |pre_existing|
  on TravelInsurancePage do |page|
    page.is_pre_existing pre_existing
  end  
end

When(/^I click Get Quote$/) do
  on TravelInsurancePage do |page|
    page.click_get_quote 
  end  
end

When(/^I verify Quote Page is displayed$/) do
  on TravelInsurancePage do |page|
    page.verify_quote_page 
  end  
end

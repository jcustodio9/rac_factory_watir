class TravelInsurancePage
	include PageObject

	# define the elements of the page
	h1	 		:travel_insurance_header, xpath: '//h1[contains(text(), "Travel insurance")]'

	# elements for mobile interface
	select_list :travel_destination, xpath: '//select[@id="regionID"]'
	select_list :country, xpath: '//select[@id="destinationCountryID"]'
	button 		:next_button, xpath: '//input[@id="quoteSubmitBtn"]'
	link 		:departure_date_picker, xpath: '//input[@id="departureDate"]/following-sibling::a'
	link 		:return_date_picker, xpath: '//input[@id="returnDate"]/following-sibling::a'
	h4 			:calendar_label, xpath: '//div[contains(@class, "ui-datebox-container ui-overlay-shadow ui-corner-all pop ui-body-b in")]//div/div[contains(@class, "ui-datebox-gridlabel")]/h4'
	span 		:calendar_next, xpath: '//div[contains(@class, "ui-datebox-container ui-overlay-shadow ui-corner-all pop ui-body-b in")]//div[contains(@class, "gridplus")]//span[contains(@class, "ui-icon-plus")]'	
	text_field 	:traveler_1_age, xpath: '//input[@id="travelerAge_1"]'
	text_field 	:traveler_2_age, xpath: '//input[@id="travelerAge_2"]'
	select_list :accompanied_children, xpath: '//select[@id="totalChildren"]'
	select_list :is_rac_member, xpath: '//select[@id="isMember"]'
	span 		:pre_existing_yes, xpath: '//span[contains(@class, "slider")][contains(text(), "Yes")]'
	span 		:pre_existing_no, xpath: '//span[contains(@class, "slider")][contains(text(), "No")]'
	h1 			:your_quote_header_mobile, xpath: '//h1[contains(text(), "Your Quote")]'
	div 		:trip_info_pc, css: '#content > div > div > table > thead > tr > th'


	def verify_travel_insurance_page
		travel_insurance_header_element.visible?
	end


	def select_destination destination
		case ENV['BROWSER']
      		when "iphone","ipad","android_phone","android_tablet" then
				self.travel_destination = "#{destination}"
      		else
				@browser.iframe(:id, 'quote-frame').select_list(:id, 'regionID').select destination
      		end
      	sleep 1
    end   


	def select_country country
		wait_for_country_list
		case ENV['BROWSER']
      		when "iphone","ipad","android_phone","android_tablet" then
				self.country = "#{country}"
				next_button
				sleep 3
      		else
				@browser.iframe(:id, 'quote-frame').select_list(:id, 'destinationCountryID').select country
				sleep 1
      		end
	end


	def pick_departure_date departure_date,departure_month,departure_year
		case ENV['BROWSER']
      		when "iphone","ipad","android_phone","android_tablet" then
				departure_date_picker
				until calendar_label_element.text.eql? departure_month + ' ' + departure_year
					calendar_next_element.click
				end
				@browser.divs(:xpath, '//div[contains(@class, "ui-datebox-container ui-overlay-shadow ui-corner-all pop ui-body-b in")]/div[@class="ui-datebox-grid"]/div[@class="ui-datebox-gridrow"]/div[contains(@class, "ui-datebox-griddate")]').each do |cell|
					if cell.text.eql? "#{departure_date}"
						cell.flash
						cell.click
						break
					end
				end
      		else
				frame = @browser.iframe(:id, 'quote-frame')
				frame.text_field(:id, 'departureDate').fire_event("onfocus")
				frame.button(:name, 'getQuote').focus()
				until ((frame.element(:class, 'ui-datepicker-month').text.eql? "#{departure_month}".upcase) && (frame.element(:class, 'ui-datepicker-year').text.eql? "#{departure_year}"))
					frame.link(:class, 'ui-datepicker-next ui-corner-all').click
				end
				frame.div(:id, 'ui-datepicker-div').table(:class, 'ui-datepicker-calendar').rows.each_with_index do |row, index|
					row.cells.each do |cell|
						if cell.text.eql? "#{departure_date}"
							cell.click
							break
						end
					end
				end
      		end
      	sleep 1
	end


	def pick_return_date return_date,return_month,return_year
		case ENV['BROWSER']
      		when "iphone","ipad","android_phone","android_tablet" then
				return_date_picker
				until calendar_label_element.text.eql? return_month + ' ' + return_year
					calendar_next_element.click
				end
				@browser.divs(:xpath, '//div[contains(@class, "ui-datebox-container ui-overlay-shadow ui-corner-all pop ui-body-b in")]/div[@class="ui-datebox-grid"]/div[@class="ui-datebox-gridrow"]/div[contains(@class, "ui-datebox-griddate")]').each do |cell|
					if cell.text.eql? "#{return_date}"
						cell.flash
						cell.click
						break
					end
				end
      		else
				frame = @browser.iframe(:id, 'quote-frame')
				frame.text_field(:id, 'returnDate').fire_event("onfocus")
				until ((frame.element(:class, 'ui-datepicker-month').text.eql? "#{return_month}".upcase) && (frame.element(:class, 'ui-datepicker-year').text.eql? "#{return_year}"))
					frame.link(:class, 'ui-datepicker-next ui-corner-all').click
				end
				frame.div(:id, 'ui-datepicker-div').table(:class, 'ui-datepicker-calendar').rows.each_with_index do |row, index|
					row.cells.each do |cell|
						if cell.text.eql? "#{return_date}"
							cell.click
							break
						end
					end
				end
      		end
      	loading_wait		
	end


	def enter_travellers_ages traveller_1,traveller_2
		unless traveller_1.eql? "NA"
			case ENV['BROWSER']
			when "iphone","ipad","android_phone","android_tablet" then
				next_button
				sleep 2
				traveler_1_age_element.send_keys traveller_1
			else
				frame = @browser.iframe(:id, 'quote-frame')
				frame.text_field(:id, 'travelerAge_1').fire_event("onfocus")
				frame.text_field(:id, 'travelerAge_1').send_keys traveller_1
			end
		end

		unless traveller_2.eql? "NA"
			sleep 3
			case ENV['BROWSER']
			when "iphone","ipad","android_phone","android_tablet" then
				traveler_2_age_element.send_keys traveller_2
			else
				frame = @browser.iframe(:id, 'quote-frame')
				frame.text_field(:id, 'travelerAge_2').fire_event("onfocus")
				frame.text_field(:id, 'travelerAge_2').send_keys traveller_2
			end
		end
		
	end

	
	def select_accompanied_children children
		unless children.eql? "NA"
			sleep 3
			case ENV['BROWSER']
			when "iphone","ipad","android_phone","android_tablet" then
				self.accompanied_children = "#{children}"
			else
				@browser.iframe(:id, 'quote-frame').select_list(:id, 'totalChildren').select children
			end
		end
	end


	def is_resident resident
		unless resident.eql? "NA"
			sleep 3
			case ENV['BROWSER']
			when "firefox","ie","chrome" then
				if resident.eql? "Yes"
					@browser.iframe(:id, 'quote-frame').radio(:id, 'isResident_1').set
				else
					@browser.iframe(:id, 'quote-frame').radio(:id, 'isResident_2').set	
				end
			end
		end
	end


	def is_rac_member membership
		unless membership.eql? "NA"
			sleep 3
			case ENV['BROWSER']
			when "iphone","ipad","android_phone","android_tablet" then
				self.is_rac_member = "#{membership}"
			else
				@browser.iframe(:id, 'quote-frame').select_list(:id, 'isMember').select membership
			end
		end		
	end


	def is_pre_existing pre_existing
		unless pre_existing.eql? "NA"
			sleep 3
			case ENV['BROWSER']
			when "iphone","ipad","android_phone","android_tablet" then
				if pre_existing.eql? "Yes"
        			pre_existing_yes_element.click
      			else
      				#do nothing since default is 'No'
      		 	end
			end
		end			
	end


	def click_get_quote
		case ENV['BROWSER']
			when "iphone","ipad","android_phone","android_tablet" then
				next_button_element.focus()
				next_button
			else
				@browser.iframe(:id, 'quote-frame').button(:name, 'getQuote').click
			end
		sleep 3	
	end


	def verify_quote_page
		case ENV['BROWSER']
			when "iphone","ipad","android_phone","android_tablet" then
				your_quote_header_mobile_element.exists?
				your_quote_header_mobile_element.flash
			else
				trip_info_pc_element.exists?
				@browser.element(:css, '#content > div > div > table > thead > tr > th').flash
			end
	end



	private 
  	#waits for the loading to disappear
  	def loading_wait
    	case ENV['BROWSER']
    	when "iphone","ipad","android_phone","android_tablet" then
      		Watir::Wait.until {
        		not @browser.element(xpath: '//div[contains(@class, "load")]').visible?
      		}
    	else
      		Watir::Wait.until {
        		not @browser.iframe(:id, 'quote-frame').div(xpath: '//div[contains(@id, "load")]').visible?
      		}
    	end
  	end

  	#waits for the country list to be fully loaded
  	def wait_for_country_list
    	case ENV['BROWSER']
    	when "iphone","ipad","android_phone","android_tablet" then
      		Watir::Wait.until {
        		self.country = "Select Country"
      		}
    	else
      		Watir::Wait.until {
        		@browser.iframe(:id, 'quote-frame').select_list(:id, 'destinationCountryID').text.eql? "Select Country"
      		}
    	end
  	end
    
end #TravelInsurancePage class
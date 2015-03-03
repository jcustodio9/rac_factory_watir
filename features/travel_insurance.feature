Feature: As potential RAC customer I want to get a quote on travel insurance
I want to check I can access and get a quote for a travel insurance

@travel_insurance_quote @mobile
Scenario Outline: Get a quote for a travel insurance
Given I navigate to RAC home page
When I click on the navigation link:
    | menu     		| submenu           | link 					|
    | travel	 	| Travel insurance 	| Get a quote 			|
And I should see the Travel insurance page
And I select Area of Travel: <destination>
And I select Primary Country: <country>
And I select Departure Date: <departure_date> Month: <departure_month> Year: <departure_year>
And I select Return Date: <return_date> Month: <return_month> Year: <return_year>
And I enter Traveller's Age: <traveller_1> <traveller_2>
And I select number of accompanied children: <children>
And I select if resident: <resident>
And I select RAC membership: <membership>
And I select if has pre-existing condition: <pre_existing>
And I click Get Quote


Examples:
| destination 	| country 		| departure_date 	| departure_month 	| departure_year 	| return_date 	| return_month 	| return_year 	| traveller_1 	| traveller_2 	| children 	| resident 	| membership 	| pre_existing 	|
| Asia 			| Philippines 	| 17 				| December 			| 2015 				| 9 			| January 		| 2016 			| 32 			| NA 			| 0 		| Yes 		| No 			| No 			|

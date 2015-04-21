class HomePage
	include PageObject

	page_url("#{ENV['URL']}")

	# define the elements of the page

	#opens the url defined in ENV['URL']
	def goto_homepage
  		visit(HomePage)

  	end

    
end
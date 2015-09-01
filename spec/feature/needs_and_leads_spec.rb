require "capybara/rspec"
require "spec_helper"

feature "Homepage" do

	scenario "User sees the title when homepage is visited" do
		visit '/'
		expect(page).to have_content "Needs And Leads"
	end

	scenario "User can add new lead" do 
		visit '/'
		click_link "Add Need"

		fill_in("title", :with => "Personal body guard needed")
		fill_in("description", :with => "It's a tough world and I need protection!")
		click_button("Submit")

		expect(page).to have_content("Personal body guard needed")

	end

end
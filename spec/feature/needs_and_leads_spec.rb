require "capybara/rspec"
require "spec_helper"

feature "Core functionality" do

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

	scenario "Users view needs individually" do
		Need.create(title: "Help wanted", description: "Please help comb my hair")

		visit '/'
		click_link 'Help wanted'

		expect(current_path).to eq('/need/2') #unclean db
		expect(page).to have_content("Help wanted")
		expect(page).to have_content("Please help comb my hair")
	end
	
	scenario "Users can respond to needs with leads" do
		Need.create(title: "Help wanted", description: "Please help comb my hair")

		visit '/'
		click_link "Reply with Lead"

		fill_in("reply", :with => "I can do it!")
		click_button("Reply")

		expect(page).to have_content("1 Lead")

	end
end
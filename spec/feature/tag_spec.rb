require "capybara/rspec"
require "spec_helper"

feature "Users can add tags to needs" do 
	scenario "Adding tags" do
		visit '/'
		click_link "Add Need"

		fill_in("title", :with => "Personal body guard needed")
		fill_in("description", :with => "It's a tough world and I need protection!")
		fill_in("tags", :with => "Security")

		click_button("Submit")

		expect(page).to have_content("Tags: Security")

	end

	scenario "Filterable by tags" do 
		visit '/'
		click_link "Add Need"

		fill_in("title", :with => "Personal bodyguard needed")
		fill_in("description", :with => "It's a tough world and I need protection!")
		fill_in("tags", :with => "Security")

		click_button("Submit")

		click_link "Add Need"

		fill_in("title", :with => "Personal trainer needed")
		fill_in("description", :with => "It's a tough world and I need to be tough!")
		fill_in("tags", :with => "Fitness")

		click_button("Submit")

		click_link("Security")
		expect(page).to have_content("Personal bodyguard needed")

		visit('/')
		click_link("Fitness")
		expect(page).to have_content("Personal trainer needed")

	end

end
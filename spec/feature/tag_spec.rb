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

end
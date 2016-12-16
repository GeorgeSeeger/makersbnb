require 'spec_helper'

feature "User logs out" do
  include Helpers
  scenario "clicking logout button" do
    user = {first_name: "Malin", last_name: "Patel", username: "malina", email: "malina@gmail.com", password: "gugu123"}
    sign_up(user)
    click_link 'logout'
    expect(page).to have_content "Are you sure you want to log out?"
    click_button 'logout-btn'
    expect(page).to have_content "Goodbye Malin"
  end
end

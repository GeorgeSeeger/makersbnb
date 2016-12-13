require './app/app'

feature "Creating new requests" do
  include Helpers

  scenario "a guest creates a new request" do
    user = {first_name: "Malin", last_name: "Patel", username: "malina", email: "malina@gmail.com", password: "gugu123"}

    user2 = {first_name: "Pea", last_name: "Crystal", username: "pea", email: "pea@gmail.com", password: "secret"}

    space = {name: "London Penthouse", description: "3 bed, 1 swimming pool, in-house chef", price: "100", start_date: "2017-01-01", end_date: "2017-12-12"}

    sign_up(user)
    list_property(space)
    sign_up(user2)

    make_request(Space.first)
    expect(current_path).to eq('/spaces/view')
    expect(page).to have_content("Your booking request for London Penthouse has been sent to the owner")
  end
end

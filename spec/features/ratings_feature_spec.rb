require "rails_helper"

feature "rating workspaces" do
  before do
    sign_up("dg@daniela.com", "testtest", "testtest")
    add_workspace("Trade")
  end

  scenario "user rates a workspace" do
    rate_workspace("Trade", 5, 1, 5, 5, 1)
    click_link "Trade"
    expect(page)
    .to have_content "WiFi rating: 5 Seating rating: 1 Outlets rating: 5 
                      Noise level rating: 5 Coffee rating: 1"
  end

  # scenario "users can only rate workspaces once" do
  #   sign_up(email, password, password_confirmation)
  #   add_workspace("Trade")
  #   rate_workspace("Trade", 5, 1, 5)
  #   rate_workspace("Trade", 5, 1, 5)
  #   expect(page).to have_content "You have already rated Trade's wifi"
  # end

  scenario "users can view average ratings for attributes" do
    rate_workspace("Trade", 5, 5, 5, 5, 5)
    click_link "Sign out"
    sign_up("zade@hamid.com", "testtest", "testtest")
    rate_workspace("Trade", 1, 1, 1, 1, 1)
    click_link "Trade"
    expect(page)
    .to have_content "WiFi rating: 3 Seating rating: 3 Outlets rating: 3 
                      Noise level rating: 3 Coffee rating: 3"
  end

  scenario "users can view overall average of workspaces" do
    rate_workspace("Trade", 5, 5, 5, 5, 5)
    expect(page).to have_content "Overall rating: 5"
  end
end

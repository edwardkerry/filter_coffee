require "rails_helper"

feature "rating workspaces" do
  scenario "user rates a workspace" do
    sign_up("dg@daniela.com", "testtest", "testtest")
    add_workspace("Trade")
    rate_workspace("Trade", 5, 1)
    click_link "Trade"
    expect(page).to have_content "WiFi rating: 5"
    expect(page).to have_content "Seating rating: 5"
  end

  # scenario "users can only rate workspaces once" do
  #   sign_up(email, password, password_confirmation)
  #   add_workspace("Trade")
  #   rate_workspace("Trade", 5, 1)
  #   rate_workspace("Trade", 5, 1)
  #   expect(page).to have_content "You have already rated Trade's wifi"
  # end

  scenario "users can view average ratings for attributes" do
    sign_up("dg@daniela.com", "testtest", "testtest")
    add_workspace("Trade")
    rate_workspace("Trade", 5, 5)
    click_link "Sign out"
    sign_up("zade@hamid.com", "testtest", "testtest")
    rate_workspace("Trade", 1, 1)
    click_link "Trade"
    expect(page).to have_content "WiFi rating: 3"
    expect(page).to have_content "Seating rating: 3"
  end
end

require "rails_helper"

feature "rating workspaces" do
  scenario "user rates a workspace" do
    sign_up
    add_workspace("Trade")
    rate_workspace("Trade", 5)
    click_link "Trade"
    expect(page).to have_content "WiFi rating: 5"
  end
end

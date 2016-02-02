require "rails_helper"

xfeature "rating workspaces" do
  scenario "user rates a workspace" do
    visit "/workspaces"
    click_button "Add a workspace"
    fill_in "workspace", with: "Trade"
    select "5", from: "WiFi rating"
    expect(page).to have_content "not yet rated"
  end
end

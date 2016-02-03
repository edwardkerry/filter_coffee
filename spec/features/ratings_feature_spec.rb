require "rails_helper"

feature "rating workspaces" do
  scenario "user rates a workspace" do
    visit "/workspaces"
    click_link "Add a workspace"
    fill_in "Name", with: "Trade"
    click_button "Create Workspace"
    click_link "Rate Trade"
    select "5", from: "WiFi rating"
    expect(page).to have_content "not yet rated"
  end
end

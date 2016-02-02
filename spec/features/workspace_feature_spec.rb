require "rails_helper"

feature "work spaces" do
  context "when no work spaces have been added" do
    scenario "it should display a prompt" do
      visit "/workspaces"
      expect(page).to have_content "No workspaces added"
      expect(page).to have_button "Add a workspace"
    end
  end

end

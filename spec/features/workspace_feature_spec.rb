require "rails_helper"

feature "work spaces" do
  context "when no work spaces have been added" do
    scenario "it should display a prompt" do
      visit "/workspaces"
      expect(page).to have_content "No workspaces added"
      expect(page).to have_button "Add a workspace"
    end
  end

  context "when workspaces have been added" do
    before do
      Workspace.create(name: "SecondHome")
    end

    scenario "display workspace" do
      visit "/workspaces"
      expect(page).to have_content "SecondHome"
      expect(page).not_to have_content "No workspaces added"
    end
  end
end

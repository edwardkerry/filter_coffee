require "rails_helper"

feature "work spaces" do
  context "when no work spaces have been added" do
    scenario "it should display a prompt" do
      visit "/workspaces"
      expect(page).to have_content "No workspaces added"
      expect(page).to have_link "Add a workspace"
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

  context "creating workspaces" do
    scenario "prompts user to fill out a form to add a new workspace, then displays it" do
      add_workspace
      expect(page).to have_content "SecondHome"
      expect(current_path).to eq "/workspaces"
    end
  end

  context "viewing detailed views" do
    scenario"lets a user view a workspace" do
      add_workspace
      click_link "SecondHome"
      expect(current_path).to eq "/workspace/#{secondhome.id}"
    end
  end

end

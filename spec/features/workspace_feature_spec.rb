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
      sign_up
      add_workspace("SecondHome")
      expect(page).to have_content "SecondHome"
      expect(current_path).to eq "/workspaces"
    end
  end

  context "detailed view" do
    let!(:secondhome){Workspace.create(name: "SecondHome")}
    scenario"lets a user view a workspace" do
      visit '/workspaces'
      click_link "SecondHome"
      expect(current_path).to eq "/workspaces/#{secondhome.id}"
      expect(page).to have_content "Welcome to SecondHome"
    end
  end

  context "editing workspace entry" do
    scenario"lets a user edit a workspace" do
      sign_up
      add_workspace("SecondHome")
      click_link "SecondHome"
      click_link "Edit SecondHome"
      fill_in "Name", with: "Forges"
      click_button "Update Workspace"
      expect(page).to have_content "Forges"
      expect(page).to have_content "Edit successful"
      expect(page).not_to have_content "SecondHome"
    end
  end

  context "deleting workspace entry" do
    scenario"lets a user delete a workspace" do
      sign_up
      add_workspace("SecondHome")
      click_link "SecondHome"
      click_link "Delete SecondHome"
      expect(current_path).to eq "/workspaces"
      expect(page).to have_content "Delete successful"
      expect(page).not_to have_content "SecondHome"
    end
  end
end

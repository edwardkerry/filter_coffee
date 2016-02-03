require "rails_helper"

  def sign_up(email: 'dg@daniela.com',
              password: 'testtest',
              password_confirmation: 'testtest')
    visit "/workspaces"
    click_link("Sign up")
    fill_in("Email", with: email)
    fill_in("Password", with: password)
    fill_in("Password confirmation", with: password_confirmation)
    click_button("Sign up")
  end

  def add_workspace
    visit "/workspaces"
    click_link "Add a workspace"
    fill_in "Name", with: "SecondHome"
    click_button "Create Workspace"
  end

def sign_up(email, password, password_confirmation)
  visit "/workspaces"
  click_link("Sign up")
  fill_in("Email", with: email)
  fill_in("Password", with: password)
  fill_in("Password confirmation", with: password_confirmation)
  click_button("Sign up")
end

def add_workspace(name)
  visit "/workspaces"
  click_link "Add a workspace"
  fill_in "Name", with: name
  click_button "Create Workspace"
end

def rate_workspace(name, rating)
  visit "/workspaces"
  click_link "Rate #{name}"
  select rating, from: "rating_wifi"
  select rating, from: "rating_seating"
  click_button "Submit"
end

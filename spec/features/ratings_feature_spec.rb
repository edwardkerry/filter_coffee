require "rails_helper"

feature "rating workspaces" do
  before do
    sign_up("dg@daniela.com", "testtest", "testtest")
    add_workspace("Trade")
  end

  context "one workspace rated" do
    scenario "user rates a workspace" do
      rate_workspace("Trade", 5, 1, 5, 5, 1)
      click_link "Trade"
      expect(page)
      .to have_content "WiFi rating: ★★★★★ Seating rating: ★☆☆☆☆ Outlets rating: ★★★★★ 
                        Noise level rating: ★★★★★ Coffee rating: ★☆☆☆☆"
    end
  end

  context "rate workspaces once only" do
    scenario "users can only rate workspaces once" do
      add_workspace("Trade")
      rate_workspace("Trade", 5, 1, 5, 5, 1)
      rate_workspace("Trade", 5, 1, 5, 5, 1)
      expect(page).to have_content "You have already rated Trade's wifi"
    end
  end

  context "viewing attribute average ratings" do
    scenario "users can view average ratings for each attributes" do
      rate_workspace("Trade", 5, 5, 5, 5, 5)
      click_link "Sign out"
      sign_up("zade@hamid.com", "testtest", "testtest")
      rate_workspace("Trade", 1, 1, 1, 1, 1)
      click_link "Trade"
      expect(page)
      .to have_content "WiFi rating: ★★★☆☆ Seating rating: ★★★☆☆ Outlets rating: ★★★☆☆ 
                        Noise level rating: ★★★☆☆ Coffee rating: ★★★☆☆"
    end
  end

  context "viewing overall average ratings" do
    scenario "users can view overall average of workspaces" do
      rate_workspace("Trade", 5, 5, 5, 5, 5)
      expect(page).to have_content "Overall rating: ★★★★★"
    end
  end
end

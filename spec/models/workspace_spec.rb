require 'rails_helper'

RSpec.describe Workspace, type: :model do

  it { is_expected.to have_many :ratings }

  describe "#average_rating(att)" do
    context "no ratings" do
      it "returns N/A when there are no ratings" do
        workspace = Workspace.create(name: "space")
        expect(workspace.average_rating(:wifi)).to eq "N/A"
      end
    end

    context "one rating" do
      it "returns a rating when rated" do
        workspace = Workspace.create(name: "space")
        workspace.ratings.create(wifi: 5, seating: 5, outlets: 5, noise: 5, coffee: 5)
        expect(workspace.average_rating(:wifi)).to eq 5
        expect(workspace.average_rating(:seating)).to eq 5
        expect(workspace.average_rating(:outlets)).to eq 5
        expect(workspace.average_rating(:noise)).to eq 5
        expect(workspace.average_rating(:coffee)).to eq 5
      end
    end

    context "multiple ratings" do
      it "returns average ratings" do
        workspace = Workspace.create(name: "space")
        workspace.ratings.create(wifi: 5, seating: 5, outlets: 5, noise: 5, coffee: 5)
        workspace.ratings.create(wifi: 1, seating: 1, outlets: 1, noise: 1, coffee: 1)
        expect(workspace.average_rating(:wifi)).to eq 3
        expect(workspace.average_rating(:seating)).to eq 3
        expect(workspace.average_rating(:outlets)).to eq 3
        expect(workspace.average_rating(:noise)).to eq 3
        expect(workspace.average_rating(:coffee)).to eq 3
      end
    end
  end

  describe "#overall_ratings" do
    context "no ratings" do
      it "returns N/A when there are no ratings" do
        workspace = Workspace.create(name: "space")
        expect(workspace.overall_rating).to eq "N/A"
      end
    end

    context "returns overall ratings" do
      it "based on wifi, seating, outlets, noise and coffee ratings" do
        workspace = Workspace.create(name: "space")
        workspace.ratings.create(wifi: 5, seating: 4, outlets: 3, noise: 2, coffee: 1)
        expect(workspace.overall_rating).to eq 3
      end
    end
  end
end

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
        workspace.ratings.create(wifi: 5, seating: 5)
        p workspace
        expect(workspace.average_rating(:wifi)).to eq 5
      end
    end

    context "multiple ratings" do
      it "returns average ratings" do
        workspace = Workspace.create(name: "space")
        workspace.ratings.create(wifi: 5, seating:5)
        workspace.ratings.create(wifi: 1, seating:5)
        expect(workspace.average_rating(:wifi)).to eq 3
      end
    end
  end

  # describe "#average_rating_seating" do
  #   context "no ratings" do
  #     it "returns N/A when there are no ratings" do
  #       workspace = Workspace.create(name: "space")
  #       expect(workspace.average_rating_seating).to eq "N/A"
  #     end
  #   end

  #   context "one rating" do
  #     it "returns a rating when rated" do
  #       workspace = Workspace.create(name: "space")
  #       workspace.ratings.create(seating: 5)
  #       p workspace
  #       p workspace.ratings
  #       expect(workspace.average_rating_seating).to eq 5
  #     end
  #   end

  #   context "multiple ratings" do
  #     it "returns average ratings" do
  #       workspace = Workspace.create(name: "space")
  #       workspace.ratings.create(seating: 5)
  #       workspace.ratings.create(seating: 1)
  #       expect(workspace.average_rating_seating).to eq 3
  #     end
  #   end
  # end
end

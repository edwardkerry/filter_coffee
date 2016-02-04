require 'rails_helper'

RSpec.describe Workspace, type: :model do
  let(:workspace) { described_class.create(name: "space") }

  it { is_expected.to have_many :ratings }

  describe "#average_rating(att)" do
    context "no ratings" do
      describe "returns N/A when there are no ratings" do
        it "for wifi" do
          expect(workspace.average_rating(:wifi)).to eq "N/A"
        end

        it "for seating" do
          expect(workspace.average_rating(:seating)).to eq "N/A"
        end

        it "for outlets" do
          expect(workspace.average_rating(:outlets)).to eq "N/A"
        end

        it "for noise" do
          expect(workspace.average_rating(:noise)).to eq "N/A"
        end

        it "for coffee" do
          expect(workspace.average_rating(:coffee)).to eq "N/A"
        end
      end
    end

    describe "returns a rating when rated" do
      before do
        workspace.ratings.create(wifi: 5, seating: 5, outlets: 5, noise: 5, coffee: 5)
      end

      context "one rating" do
        describe "returns a rating" do
          it "when wifi rated" do
            expect(workspace.average_rating(:wifi)).to eq 5
          end

          it "when seating rated" do
            expect(workspace.average_rating(:seating)).to eq 5
          end

          it "when outlets rated" do
            expect(workspace.average_rating(:outlets)).to eq 5
          end

          it "when noise rated" do
            expect(workspace.average_rating(:noise)).to eq 5
          end

          it "when coffee rated" do
            expect(workspace.average_rating(:coffee)).to eq 5
          end
        end
      end

      context "multiple ratings" do
        before do
          workspace.ratings.new(wifi: 3, seating: 3, outlets: 3, noise: 3, coffee: 3).save(validate: false)
          workspace.ratings.new(wifi: 1, seating: 1, outlets: 1, noise: 1, coffee: 1).save(validate: false)
        end
        describe "returns average ratings" do
          it "for wifi" do
            expect(workspace.average_rating(:wifi)).to eq 3
          end

          it "for seating" do
            expect(workspace.average_rating(:seating)).to eq 3
          end

          it "for outlets" do
            expect(workspace.average_rating(:outlets)).to eq 3
          end

          it "for noise" do
            expect(workspace.average_rating(:noise)).to eq 3
          end

          it "for coffee" do
            expect(workspace.average_rating(:coffee)).to eq 3
          end
        end
      end
    end
  end

  describe "#overall_ratings" do
    context "no ratings" do
      it "returns N/A when there are no ratings" do
        expect(workspace.overall_rating).to eq "N/A"
      end
    end

    context "returns overall ratings" do
      it "based on wifi, seating, outlets, noise and coffee ratings" do
        workspace.ratings.create(wifi: 5, seating: 4, outlets: 3, noise: 2, coffee: 1)
        expect(workspace.overall_rating).to eq 3
      end
    end
  end
end

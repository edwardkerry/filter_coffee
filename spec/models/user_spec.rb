require "rails_helper"

RSpec.describe User, type: :model do
  it { is_expected.to have_many :workspaces }
  it { is_expected.to have_many :ratings }
end

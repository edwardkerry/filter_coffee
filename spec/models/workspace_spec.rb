require 'rails_helper'

RSpec.describe Workspace, type: :model do


  it { is_expected.to have_many :ratings }

end

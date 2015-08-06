require 'rails_helper'

RSpec.describe Stage do

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:messages) }

end

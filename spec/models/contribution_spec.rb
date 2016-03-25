require 'rails_helper'

RSpec.describe Contribution do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :stage }
end

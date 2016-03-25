require 'rails_helper'

RSpec.describe Stage do

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:messages) }
  it { is_expected.to have_many(:contributions) }
  it { is_expected.to validate_presence_of(:user) }

  context 'with instance methods' do
    describe '#performance' do
      subject         { FactoryGirl.create(:stage) }
      let(:content)   { rand(1000).to_s }
      let!(:contributions) { FactoryGirl.create_list(:contribution, 2, stage: subject, content: content) }

      it { expect(subject.performance).to eql("#{content}\n#{content}") }
    end
  end

end

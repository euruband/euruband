require 'rails_helper'

RSpec.describe Message do

  it { is_expected.to belong_to(:stage) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:user) }

  describe '#contribution' do
    subject { FactoryGirl.create :message }

    context 'when not created before' do
      it 'auto-creates it' do
        expect(subject.contribution).to be_a Contribution
        expect(subject.contribution).to be_persisted
        expect(subject.contribution.content).to eql subject.content
      end
    end

    context 'when created before' do
      let!(:contribution) { FactoryGirl.create :contribution, user: subject.user, stage: subject.stage }
      it { expect(subject.contribution).to eql contribution }
    end

  end
end

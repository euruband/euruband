require 'rails_helper'

RSpec.describe Message do

  it { is_expected.to belong_to(:stage) }
  it { is_expected.to belong_to(:user) }

  describe 'callbacks' do
    context 'after save' do
      let(:user)  { FactoryGirl.create(:user) }
      let(:stage) { FactoryGirl.create(:stage) }
      let(:sample_content) { rand(10000).to_s }

      subject { described_class.new(stage: stage, user: user, content: sample_content) }

      it 'updates stage performance' do
        # stub Websockets connection to skip Redis
        expect(ActionCable).to receive_message_chain('server.broadcast').and_return(true)
        expect{ subject.save }.to change{ stage.performance }.to(sample_content+';')
      end
    end
  end

end

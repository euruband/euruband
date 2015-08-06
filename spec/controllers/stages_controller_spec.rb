require 'rails_helper'

RSpec.describe StagesController, type: :controller do
  render_views

  let(:user)  { FactoryGirl.create(:user) }
  let(:stage) { FactoryGirl.create(:stage) }

  def authenticate!
    cookies.signed[:user_id] = user.id
  end

  context 'with authenticated user' do
    before { authenticate! }

    describe 'GET show' do
      it 'renders show template' do
        get :show, params: { id: stage.id }
        expect(response).to be_ok
      end
    end

    describe 'PUT reset' do

      let!(:stage)   { FactoryGirl.create(:stage, user: user, performance: 'play(:c5);') }
      let!(:message) { FactoryGirl.create(:message, stage: stage, user: stage.user) }

      it 'deletes all messages' do
        expect{
          expect{
            put :reset, params: { id: stage.id }
          }.to change{ stage.messages.count(true) }.to(0)
        }.to change { stage.reload.performance }.to('')
      end
    end
  end

end

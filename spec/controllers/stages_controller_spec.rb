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

      let!(:stage)        { FactoryGirl.create(:stage, user: user) }
      let!(:contribution) { FactoryGirl.create(:contribution, stage: stage, user: stage.user) }
      let!(:message)      { FactoryGirl.create(:message, stage: stage, user: stage.user) }

      it 'deletes it all' do
        expect{
          expect{
            expect{
              put :reset, params: { id: stage.id }
            }.to change{ stage.contributions.count(true) }.to(0)
          }.to change{ stage.messages.count(true) }.to(0)
        }.to change { stage.performance }.to('')
      end
    end
  end

end

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
  end

end

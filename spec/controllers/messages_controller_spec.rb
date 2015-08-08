require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  render_views

  let(:user)  { FactoryGirl.create(:user) }
  let(:stage) { FactoryGirl.create(:stage) }

  def authenticate!
    cookies.signed[:user_id] = user.id
  end

  context 'with authenticated user' do
    before { authenticate! }

    describe 'POST create' do
      context 'with valid parameters' do
        it 'creates a message' do
          expect{
            post :create, stage_id: stage.id, message: { content: "play :c5" }, format: :js
          }.to change{ Message.count }.by(1)
        end

        it 'triggers sonic pi to re-reun' do
          expect_any_instance_of(SonicPi).to receive(:run).with(any_args)
          post :create, stage_id: stage.id, message: { content: "play :c5" }, format: :js
        end
      end
    end
  end
end

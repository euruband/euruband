require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  render_views

  let(:user)  { FactoryGirl.create(:user) }
  let(:stage) { FactoryGirl.create(:stage) }

  def authenticate!
    cookies.signed[:user_id] = user.id
  end

  class DummyPi
    def run(*args); true; end
    def test_connection!; true; end
  end

  context 'with authenticated user' do
    before { authenticate! }

    describe 'POST create' do
      context 'with valid parameters' do
        before { allow(controller).to receive(:pi).and_return(DummyPi.new) }
        it 'creates a message' do
          expect{
            post :create, params: { stage_id: stage.id, message: { content: "play :c5" }, format: :js }
          }.to change{ Message.count }.by(1)
        end
      end
    end
  end
end

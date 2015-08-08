require 'sonic_pi'

class MessagesController < ApplicationController
  before_action :set_stage

  def create
    @message = Message.create! permitted_params
    pi.run(current_stage.performance)
  end

  private

  def set_stage
    @stage = Stage.find(params[:stage_id])
  end

  def current_stage
    @stage
  end

  def current_user
    @current_user
  end

  def pi
    @pi ||= begin
              proxy = SonicPi.new
              proxy.test_connection!
              proxy
            end
  end

  def permitted_params
    params.require(:message).permit(:content).merge({ stage: current_stage, user: current_user })
  end

end

require 'sonic_pi'

class MessagesController < ApplicationController
  before_action :set_stage

  def create
    content = params.fetch(:message, {})[:content].to_s

    @message = Message.create! content: content, stage: current_stage, user: current_user

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

end

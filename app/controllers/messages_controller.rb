class MessagesController < ApplicationController
  before_action :set_stage

  def create
    @message = Message.create! content: params[:message][:content], stage: @stage, user: @current_user
  end

  private

  def set_stage
    @stage = Stage.find(params[:stage_id])
  end
end

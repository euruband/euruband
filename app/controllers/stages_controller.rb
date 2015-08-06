class StagesController < ApplicationController

  before_action :find_resource, only: [:show, :reset]
  helper_method :resource

  def index
    @stages = Stage.all
  end

  def show
  end

  def reset
    resource.messages.destroy_all
    resource.update_column(:performance, '')
    render :show
  end

  private

  def find_resource
    @stage = Stage.find(params[:id])
  end

  def resource
    @stage
  end

end

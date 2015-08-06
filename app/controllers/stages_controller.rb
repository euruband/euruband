class StagesController < ApplicationController

  before_action :find_resource, only: [:show, :reset, :reload, :stop]
  helper_method :resource

  def index
    @stages = Stage.all
  end

  def show
    pi.run(resource.performance)
  end

  def reload
    pi.run(resource.performance)
    render :show
  end

  def stop
    pi.stop
    render :show
  end

  def reset
    pi.stop
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

  def pi
    @pi ||= begin
              proxy = SonicPi.new
              proxy.test_connection!
              proxy
            end
  end

end

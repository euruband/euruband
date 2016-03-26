require 'sonic_pi'

class StagesController < ApplicationController

  before_action :find_resource, only: [:show, :reset, :reload, :stop]
  helper_method :resource, :current_contribution

  def index
    @stages = Stage.all
  end

  def show
    pi.run(resource.performance)
  end

  def reload
    respond_to do |format|
      format.js do
        pi.run(resource.performance)
        render status: 200, nothing: true
      end
    end
  end

  def stop
    respond_to do |format|
      format.js do
        pi.stop
        render status: 200, nothing: true
      end
    end
  end

  def reset
    pi.stop
    resource.messages.destroy_all
    resource.contributions.destroy_all
    redirect_to resource
  end

  private

  def find_resource
    @stage = Stage.find(params[:id])
  end

  def current_contribution
    @current_contribution ||= Contribution.find_or_create_by(stage: resource, user: @current_user)
  end

  def resource
    @stage
  end

  def pi
    @pi ||= begin
              proxy = SonicPi.new
              #proxy.test_connection!
              proxy
            end
  end

end

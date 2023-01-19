class AreasController < ApplicationController
  include ApplicationHelper

  def index
    @areas = AreaFacade.all_zones
    if current_user.nil?
      @area = AreaFacade.find_zone(1128)
    else
      @area = AreaFacade.find_zone(current_user.favorite_zone)
    end
  end

  def show
    @areas = AreaFacade.all_zones
    @area = AreaFacade.find_zone(params[:id])
  end
end

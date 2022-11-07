class AreasController < ApplicationController
  include ApplicationHelper

  def index
    @areas = AreaFacade.all_zones
  end

  def show
    @area = AreaFacade.find_zone(params[:id])
  end
end

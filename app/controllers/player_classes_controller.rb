class PlayerClassesController < ApplicationController
  def index
    @player_classes = PlayerClass.paginate(page:params[:page],per_page:6)
  end

  def show
    @player_class = PlayerClass.includes(:specializations).find(params[:id])
  end
end

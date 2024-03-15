class SpecializationsController < ApplicationController
  def index
    @specializations = Specialization.page(params[:page]).per(8)
  end

  def show
    @specialization = Specialization.find(params[:id])
  end
end

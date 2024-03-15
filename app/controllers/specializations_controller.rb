class SpecializationsController < ApplicationController
  def index
    @specializations = Specialization.paginate(page:params[:page],per_page:8)
  end

  def show
    @specialization = Specialization.find(params[:id])
  end
end

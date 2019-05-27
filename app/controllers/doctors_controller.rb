class DoctorsController < ApplicationController
  def index
    render :index
  end

  def search
    # Rendering a view from a post route action seems really bad and non-restful
    @doctors = DoctorSearchService.process(name: params[:name])
  end

  def show
    @doctor = Doctor.find(params[:id])
  end
end

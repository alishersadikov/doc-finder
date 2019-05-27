class DoctorsController < ApplicationController
  def index
    render :index
  end

  def search
    @doctors = DoctorSearchService.process(name: params[:name])
  end
end

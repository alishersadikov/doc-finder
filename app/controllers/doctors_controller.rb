# frozen_string_literal: true

class DoctorsController < ApplicationController
  def index
    render :index
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def landing
    render :landing
  end

  def search
    @doctors = DoctorSearchService.process(name: params[:name])
    render :index
  end
end

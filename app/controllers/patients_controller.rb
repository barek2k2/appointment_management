class PatientsController < ApplicationController
  def search
    name = params[:name]

    @patients = Patient.where("name = ?", name)
  end
end

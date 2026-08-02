class PatientsController < ApplicationController
    def search
    @patients = Patient.where(
      "name = '#{params[:name]}'"
    )
  end
end

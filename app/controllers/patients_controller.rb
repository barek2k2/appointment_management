class PatientsController < ApplicationController
    before_action :authenticate_user!

    def search
    @patients = Patient.where(
      "name = '#{params[:name]}'"
    )
  end
end

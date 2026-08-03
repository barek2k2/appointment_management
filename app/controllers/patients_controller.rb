class PatientsController < ApplicationController
    before_action :authenticate_user!

    def search
    @patients = current_user.patients.where(
      "name = '#{params[:name]}'"
    )
  end
end

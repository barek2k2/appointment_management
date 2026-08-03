class PatientsController < ApplicationController
    before_action :authenticate_user!

    def search
      @patients = current_user.patients.where(name: params[:name])
      Audit.create!(
      action: "search",
      comment: "Patient record searched",
      user: current_user,
      audited_changes: {}
     )
    end
end

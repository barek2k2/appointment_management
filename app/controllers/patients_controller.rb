class PatientsController < ApplicationController
  def index
    sort_column = Patient::ALLOWED_SORT_COLUMNS.include?(params[:sort]) ? params[:sort] : "last_name"
    @patients = Patient.sorted(sort_column)
  end
end

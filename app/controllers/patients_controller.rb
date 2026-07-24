class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: %i[ show edit update destroy ]
  before_action :audit_patient

  def index
    @patients = current_user.patients
  end

  def show
  end

  def new
    @patient = current_user.patients.new
  end

  def edit
  end

  def create
    @patient = current_user.patients.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: "Patient was successfully created." }
        format.json { render :show, status: :created }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: ["There are some errors"], status: :unprocessable_content }
      end
    end
  end

  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: "Patient was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: ["There are some errors"], status: :unprocessable_content }
      end
    end
  end

  def destroy
    @patient.destroy!

    respond_to do |format|
      format.html { redirect_to patients_path, notice: "Patient was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    def set_patient
      @patient = current_user.patients.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(:first_name, :ssn, :soccer_team_name)
    end

  def audit_patient
    record = @patient || @patients

    Audited::Audit.create!(
      auditable_type: "Patient",
      auditable_id: record.try(:id),
      action: params[:action],
      user: current_user,
      comment: "#{params[:action]} performed via PatientsController",
      audited_changes: filtered_changes(record),
      remote_address: request.remote_ip,
      request_uuid: request.uuid
    )
  end
  def filtered_changes(record)
    return {} unless record

    excluded = %w[ssn]
    record.try(:previous_changes).to_h.except(*excluded)
  end
end

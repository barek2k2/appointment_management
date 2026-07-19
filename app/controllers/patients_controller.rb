class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: %i[ show edit update destroy ]

  def index
    @patients = current_user.patients
  end

  def show
    AccessLog.create!(user: current_user, patient: @patient, action: "view", accessed_at: Time.current)
  end

  def new
    AccessLog.create!(user: current_user, patient: @patient, action: "new", accessed_at: Time.current)
    @patient = current_user.patients.new
  end

  def edit
    AccessLog.create!(user: current_user, patient: @patient, action: "edit", accessed_at: Time.current)
  end

  def create
    AccessLog.create!(user: current_user, patient: @patient, action: "create", accessed_at: Time.current)
    @patient = current_user.patients.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: "Patient was successfully created." }
        format.json { render :show, status: :created }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: ["Please check errors"], status: :unprocessable_content }
      end
    end
  end

  def update
    AccessLog.create!(user: current_user, patient: @patient, action: "update", accessed_at: Time.current)

    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: "Patient was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: ["Please check errors"], status: :unprocessable_content }
      end
    end
  end

  def destroy
    AccessLog.create!(user: current_user, patient: @patient, action: "destroy", accessed_at: Time.current)

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
      params.require(:patient).permit(:name, :ssn, :dob)
    end
end

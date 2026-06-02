class InsuranceProvidersController < ApplicationController
  before_action :set_insurance_provider, only: %i[ show edit update destroy ]

  # GET /insurance_providers or /insurance_providers.json
  def index
    @insurance_providers = InsuranceProvider.all
  end

  # GET /insurance_providers/1 or /insurance_providers/1.json
  def show
  end

  # GET /insurance_providers/new
  def new
    @insurance_provider = InsuranceProvider.new
  end

  # GET /insurance_providers/1/edit
  def edit
  end

  # POST /insurance_providers or /insurance_providers.json
  def create
    @insurance_provider = InsuranceProvider.new(insurance_provider_params)

    respond_to do |format|
      if @insurance_provider.save
        format.html { redirect_to @insurance_provider, notice: "Insurance provider was successfully created." }
        format.json { render :show, status: :created, location: @insurance_provider }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @insurance_provider.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /insurance_providers/1 or /insurance_providers/1.json
  def update
    respond_to do |format|
      if @insurance_provider.update(insurance_provider_params)
        format.html { redirect_to @insurance_provider, notice: "Insurance provider was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @insurance_provider }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @insurance_provider.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /insurance_providers/1 or /insurance_providers/1.json
  def destroy
    @insurance_provider.destroy!

    respond_to do |format|
      format.html { redirect_to insurance_providers_path, notice: "Insurance provider was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insurance_provider
      @insurance_provider = InsuranceProvider.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def insurance_provider_params
      params.require(:insurance_provider).permit(:name)
    end
end

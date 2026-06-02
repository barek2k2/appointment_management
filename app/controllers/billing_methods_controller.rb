class BillingMethodsController < ApplicationController
  before_action :set_billing_method, only: %i[ show edit update destroy ]

  # GET /billing_methods or /billing_methods.json
  def index
    @billing_methods = BillingMethod.all
  end

  # GET /billing_methods/1 or /billing_methods/1.json
  def show
  end

  # GET /billing_methods/new
  def new
    @billing_method = BillingMethod.new
  end

  # GET /billing_methods/1/edit
  def edit
  end

  # POST /billing_methods or /billing_methods.json
  def create
    @billing_method = BillingMethod.new(billing_method_params)

    respond_to do |format|
      if @billing_method.save
        format.html { redirect_to @billing_method, notice: "Billing method was successfully created." }
        format.json { render :show, status: :created, location: @billing_method }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @billing_method.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /billing_methods/1 or /billing_methods/1.json
  def update
    respond_to do |format|
      if @billing_method.update(billing_method_params)
        format.html { redirect_to @billing_method, notice: "Billing method was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @billing_method }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @billing_method.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /billing_methods/1 or /billing_methods/1.json
  def destroy
    @billing_method.destroy!

    respond_to do |format|
      format.html { redirect_to billing_methods_path, notice: "Billing method was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billing_method
      @billing_method = BillingMethod.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def billing_method_params
      params.require(:billing_method).permit(:name)
    end
end

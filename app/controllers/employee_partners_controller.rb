class EmployeePartnersController < ApplicationController
  def index
    @employee_partners = EmployeePartner.all
  end

  def show
    @employee_partner = EmployeePartner.find(params[:id])
  end

  def new
    @employee_partner = EmployeePartner.new
  end

  def create
    @employee_partner = EmployeePartner.new(employee_params)
      if @employee_partner.save
        redirect_to employees_partners_path
      else
        render :new
      end
  end

  def update
  end

  def edit
  end

  def destroy
  end
end

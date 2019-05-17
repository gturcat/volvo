class PartnersController < ApplicationController
  def index
    @partners = Pratner.all
  end

  def show
    @partner = Partner.find(params[:id])
  end

  def new
    @partner = Partner.new
  end

  def create
    @partner = Partner.new(employee_params)
      if @partner.save
        redirect_to partners_path
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

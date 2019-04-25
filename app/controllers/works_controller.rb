class WorksController < ApplicationController

  def new
    @work = Work.new
    @work.tasks.build
  end

  def create
    @work = Work.new(work_params)
    @delivery = Delivery.find(session[:delivery_id])
    @work.delivery = @delivery
    if @work.save
      redirect_to delivery_path(@delivery)
     else
      render :new
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    @work.update(work_params)
    redirect_to delivery_path(@work.delivery)
  end

private

  def work_params
    params.require(:work).permit(
      :nature_travaux,
      :devis,
      :demande_preparation,
      :facture_travaux,
      :facture_montant)
  end
end

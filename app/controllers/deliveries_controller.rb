class DeliveriesController < ApplicationController

  def index
    @deliveries = Delivery.all
  end

  def show
    session[:bus_id] = nil
    @delivery = Delivery.find(params[:id])
    session[:delivery_id] = @delivery.id
  end


  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    @delivery.update(delivery_params)
    redirect_to bus_path(@delivery.bus)
  end

  private

  def delivery_params
    params.require(:delivery).permit(
      :id,
      :lieu_prepa,
      :place_id,
      :date_livraison,
      :heure_livraison,
      :date_facturation,
      :montant,
      :entitee,
      :duree_buy_back,
      :pourcentage_buy_back
    )
  end
end

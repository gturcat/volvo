class FactoryOrdersController < ApplicationController

  def show
    raise
  end

  def edit
    @factory_order = FactoryOrder.find(params[:id])
  end

  def update
    @factory_order = FactoryOrder.find(params[:id])
    @factory_order.update(factory_order_params)
    redirect_to bus_path(@factory_order.bus)
  end

  private

  def factory_order_params
    params.require(:factory_order).permit(:id, :envoiOF, :date_limit_modif_config, :reception_oc, :dispo_fr, :CDD, :lieu_depart_usine, :date_depart_usine, :lieu_arrivee_partenaire_volvo, :date_arrivee_partenaire_volvo, :partenaire_prevenu)
  end
end


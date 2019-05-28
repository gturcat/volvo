class FactoryOrdersController < ApplicationController

  def edit
    @factory_order = FactoryOrder.find(params[:id])
  end

  def update
    @factory_order = FactoryOrder.find(params[:id])
    @partner = Partner.find_by(nom: params["factory_order"]["partners"]["nom"])
    @employees = @partner.employee_partners
    @employees.each do |employee|
      PartnerMailer.confirm(employee.email, @factory_order, @partner).deliver_now
    end
    redirect_to bus_path(@factory_order.bus)
  end

  private

  def factory_order_params
    params.require(:factory_order).permit(:id, :envoiOF, :date_limit_modif_config, :reception_oc, :dispo_fr, :CDD, :lieu_depart_usine, :date_depart_usine, :lieu_arrivee_partenaire_volvo, :date_arrivee_partenaire_volvo, :partenaire_prevenu, :partner_id)
  end
end

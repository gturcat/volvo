class FactoryOrdersController < ApplicationController

  def edit
    @factory_order = FactoryOrder.find(params[:id])
  end

  def update
    @factory_order = FactoryOrder.find(params[:id])
    @factory_order.lieu_arrivee_partenaire_volvo = params["factory_order"]["lieu_arrivee_partenaire_volvo"]
    @partner = Partner.find_by(adresse: params["factory_order"]["lieu_arrivee_partenaire_volvo"])
    if @factory_order.update(factory_order_params)
      redirect_to bus_path(@factory_order.bus)
    end
  end

  def partner_mail
    @factory_order = FactoryOrder.find(params[:id])
    @partner = Partner.find_by(adresse: @factory_order.lieu_arrivee_partenaire_volvo)
    @employees = @partner.employee_partners
    @employees.each do |employee|
      PartnerMailer.confirm(employee.email, @factory_order, @partner).deliver_now
    end
    flash[:alert] = "Votre mail a été envoyé au Partenaire Volvo"
    redirect_to bus_path(@factory_order.bus)
  end

  private

  def factory_order_params
    params.require(:factory_order).permit(:id, :envoiOF, :date_limit_modif_config, :reception_oc, :dispo_fr, :CDD, :lieu_depart_usine, :date_depart_usine, :lieu_arrivee_partenaire_volvo, :date_arrivee_partenaire_volvo, :partenaire_prevenu, :partner_id)
  end
end

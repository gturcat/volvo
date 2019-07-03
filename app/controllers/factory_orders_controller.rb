class FactoryOrdersController < ApplicationController

  def edit
    @factory_order = FactoryOrder.find(params[:id])
  end

  def update
    @factory_order = FactoryOrder.find(params[:id])
    @factory_order.update(factory_order_params)
    if @factory_order.cancel?
      @factory_order.delete
    end
    # @employee = EmployeePartner.find_by(email: params["factory_order"]["partners"]["employee_partners"]["email"])
    # @mail = @employee.email
    # @partner = @employee.partner
    # PartnerMailer.confirm(@mail, @factory_order, @partner).deliver_now
    redirect_to bus_path(@factory_order.bus)
  end

  private

  def factory_order_params
    params.require(:factory_order)
    .permit(:id,
            :envoiOF,
            :date_limit_modif_config,
            :reception_oc,
            :dispo_fr,
            :CDD,
            :lieu_depart_usine,
            :date_depart_usine,
            :lieu_arrivee_partenaire_volvo,
            :date_arrivee_partenaire_volvo,
            :partenaire_prevenu,
            :partner_id,
            :vcr,
            :document_de_transport,
            :delivery_note,
            :vcr,
            :statut,
            photos_livraison: []
            )
  end
end

class DeliveriesController < ApplicationController

  def index
    @deliveries = Delivery.all
  end

  def show
    session[:bus_id] = nil
    session[:trade_id] = nil
    session[:order_id] = nil
    @delivery = Delivery.find(params[:id])
    @line = @delivery.line
    @bus = @line.bus
    @order = @line.order
    session[:delivery_id] = @delivery.id
    @trade = @order.trades.last
    @traded_bus = @trade.bus if @trade.present?
    @documents_facturation = ["Facture"]
    @documents_envoyés = ["Bon de commande",
                          "offre configuration avec plan d'implantation",
                          "Information Peinture",
                          "Plan VOSP",
                          "Fiche RCR"
                          ]
    if !@bus.immatriculation.present?
      @documents_immatriculation = ["Attestation Amenagement",
                                    "C.O.C",
                                    "C.P.I"
                                    ]
    elsif @bus.immatriculation.present?
      @documents_immatriculation = ["CERFA Chamgement de titulaire",
                                    "CERFA Cesssion",
                                    "C.P.I"
                                    ]
    end
    @documents_livraison_effective = [
                                      "C.D.O.K",
                                    "Bulletion de livraison",
                                    "Attestation E.A.D",
                                    "Attestation Limiteur de Vitesse",
                                    "Plan VOSP",
                                    "Photo véhicule"
                                    ]
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    @delivery.update(delivery_params)
    redirect_to delivery_path(@delivery)
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
      :pourcentage_buy_back,
      :date_demande_immat_envoye,
      :transmision_PV_DF_RCR,
      :enregistrement_vda,
      :enregistrement_cm
    )
  end
end

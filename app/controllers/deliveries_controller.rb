class DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.where(statut: nil)
  end

  def close
    @delivery = Delivery.find(params[:id])
    @line = @delivery.line
    @bus = @line.bus
    @delivery.statut = true
    @delivery.save
    @bus.statut1 = "client"
    @bus.statut2 = nil
    @bus.save
    redirect_to delivery_path(@delivery)
  end

  def show
    session[:bus_id] = nil
    session[:trade_id] = nil
    session[:order_id] = nil
    @delivery = Delivery.find(params[:id])
    @line = @delivery.line
    @bus = @line.bus
    set_documents
    @delivery = Delivery.find(params[:id])
    @line = @delivery.line
    @bus = @line.bus
    @ready_to_close = true if ready_to_close?
    @order = @line.order
    session[:delivery_id] = @delivery.id
    @trade = @order.trades.last
    @traded_bus = @trade.bus if @trade.present?
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


  def set_documents
    @documents_livraison_effective = [
                                    "C.D.O.K",
                                    "Bulletion de livraison",
                                    "Attestation E.A.D",
                                    "Attestation Limiteur de Vitesse",
                                    "Plan VOSP",
                                    "Photo véhicule"
                                    ]
    @documents_facturation = ["Facture"]
    @documents_envoyés = ["Bon de commande",
                          "offre configuration avec plan d'implantation",
                          "Information Peinture",
                          "Plan VOSP",
                          "Fiche RCR"
                          ]
    if !@bus.immatriculation.present? # si vehicule neuf
      @documents_immatriculation = ["Attestation Amenagement",
                                    "C.O.C",
                                    "C.P.I"
                                    ]
      @documents_cloture_adv = [
                              "Facture",
                              ]
    elsif @bus.immatriculation.present? # si vehicule d'occasion
      @documents_immatriculation = ["CERFA Chamgement de titulaire",
                                    "CERFA Cesssion",
                                    "C.P.I"
                                    ]
      @documents_cloture_adv = [
                              "Facture",
                              "A. Reception - Envoi des papiers originaux au client"
                              ]
    end
  end

  def ready_to_close?
    answer = false
    if @bus.immatriculation.present? # si VO
      answer = @delivery.enregistrement_vda && @delivery.enregistrement_cm && @delivery.transmission_bl_controlling && @delivery.doc_originaux_envoyés_client && @delivery.envoi_double_cle
    end
    if !@bus.immatriculation.present? # si VN
      answer = @delivery.enregistrement_vda && @delivery.enregistrement_cm && @delivery.transmission_bl_controlling
    end
    all_documents_present? if answer
    return all_documents_present?
  end

  def all_documents_present?
    answer = true
    needed_documents = @documents_livraison_effective + @documents_cloture_adv
    needed_documents.each do |name|
      answer = false unless @delivery.documents.where(name: name).present?
    end
    return answer
  end

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
      :enregistrement_cm,
      :transmission_bl_controlling,
      :envoi_double_cle,
      :doc_originaux_envoyés_client
    )
  end
end

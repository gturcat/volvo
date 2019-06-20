class DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.where(statut: true)
  end

  def archive
    @deliveries = Delivery.where(statut: false)
  end

  def close
    if ready_to_close?
      @delivery = Delivery.find(params[:id])
      @line = @delivery.line
      @bus = @line.bus
      @delivery.statut = false
      @delivery.save
      @bus.statut1 = "client"
      @bus.statut2 = nil
      @bus.mention_garantie = @line.mention_garantie if !@bus.mention_garantie.present?
      @bus.save
    end
    redirect_to delivery_path(@delivery)
  end

  def show
    session[:bus_id] = nil
    session[:trade_id] = nil
    session[:order_id] = nil
    @delivery = Delivery.find(params[:id])
    @line = @delivery.line
    @bus = @line.bus
    # set_documents
    @delivery = Delivery.find(params[:id])
    @line = @delivery.line
    @bus = @line.bus
    @ready_to_close = true if ready_to_close?
    @order = @line.order
    session[:delivery_id] = @delivery.id
    @trade = @order.trades.last
    @traded_bus = @trade.bus if @trade.present?
    @training = @line.training
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


  # def set_documents
  #   @documents_financement = ["Justificatif financement"]
  #   @documents_livraison_effective = [
  #                                   "C.D.O.K",
  #                                   "Bulletion de livraison",
  #                                   "Attestation E.A.D",
  #                                   "Attestation Limiteur de Vitesse",
  #                                   "Plan VOSP",
  #                                   "Photo véhicule"
  #                                   ]
  #   @documents_facturation = ["Facture"]
  #   @documents_envoyés = ["Bon de commande",
  #                         "offre configuration avec plan d'implantation",
  #                         "Information Peinture",
  #                         "Plan VOSP",
  #                         "Fiche RCR"
  #                         ]
  #   if !@bus.immatriculation.present? # si vehicule neuf
  #     @documents_immatriculation = ["Attestation Amenagement",
  #                                   "C.O.C",
  #                                   "C.P.I"
  #                                   ]
  #     @documents_cloture_adv = [
  #                             "Facture",
  #                             ]
  #   elsif @bus.immatriculation.present? # si vehicule d'occasion
  #     @documents_immatriculation = ["CERFA Chamgement de titulaire",
  #                                   "CERFA Cesssion",
  #                                   "C.P.I"
  #                                   ]
  #     @documents_cloture_adv = [
  #                             "Facture",
  #                             "A. Reception - Envoi des papiers originaux au client"
  #                             ]
  #   end
  # end

  def ready_to_close?
    answer = false
    if @bus.immatriculation.present? # si VO
      answer = true if  @delivery.enregistrement_vda.present? && @delivery.enregistrement_cm.present? && @delivery.transmission_bl_controlling.present? && @delivery.doc_originaux_envoyés_client.present? && @delivery.envoi_double_cle.present?
    end
    if !@bus.immatriculation.present? # si VN
      answer = true if  @delivery.enregistrement_vda.present? && @delivery.enregistrement_cm.present? && @delivery.transmission_bl_controlling.present?
    end
    all_documents_present? if answer
    return (all_documents_present? && answer)
  end

  def all_documents_present?
    answer = false
    # needed_documents = @documents_livraison_effective + @documents_cloture_adv
    if (@delivery.CDOC.attached? && @delivery.Bulletion_de_livraison.attached? && @delivery.Attestation_EAD.attached? && @delivery.Attestation_Limiteur_de_Vitesse.attached? && @delivery.Plan_VOSP.attached? && @delivery.Photos_Vehicule.attached? && delivery.Facture.attached)
      answer = true
    end
    if @bus.immatriculation.present?
     answer = @delivery.A_Reception_Envoi_papiers_originaux.attached?
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
      :doc_originaux_envoyés_client,
      :garantie_pep_tool,
      :telematique_demandee,
      :note,
      :attestation_amenagement,
      :coc,
      :cpi,
      :cerfa_changement_titulaire,
      :cerfa_cession,
      :Bulletion_de_livraison,
      :CDOC,
      :Attestation_EAD,
      :Attestation_Limiteur_de_Vitesse,
      :Photos_Vehicule,
      :Farcture,
      :Bon_de_commande,
      :offre_configuration_avec_plan_implantation,
      :Information_Peinture,
      :Plan_VOSP,
      :Fiche_RCR,
      :A_Reception_Envoi_papiers_originaux,
      :Justificatif_Financement,
    )
  end
end

class BusesController < ApplicationController
  def index
    session[:order_id] = nil
    @descriptions = Description.all
    @types = Type.all
    @orders = Order.all
    @buses = Bus.where.not(statut1: :facture_livre)
  end

  def show
    session[:delivery_id] = nil
    session[:order_id] = nil
    session[:trade_id] = nil
    set_documents
    @bus = Bus.find(params[:id])
    session[:bus_id] = @bus.id

    if @bus.factory_orders.last.present?
      @factory_order = @bus.factory_orders.last
      @partners = Partner.all
    else
      @factory_order = @bus.factory_orders.build
      @partners = Partner.all
    end

    @bus.ferries.build
    @order = @bus.orders.pending.take
    @line = @order.lines.where(bus_id: @bus.id).take if @order.present?
    @delivery = Delivery.find(@line.delivery_id) if @order.present?
    @active_trade = @bus.trades.where("status = true").take
  end

  def new
    @bus = Bus.new
    @descriptions = Description.all
    @types = Type.all
    @order = Order.find(params[:order_id]) if params[:order_id].present?
    @ordered_bus = Bus.find(params[:bus_id]) if params[:bus_id].present?
    @line = Line.find(params[:line_id]) if params[:line_id].present?
    #@buses = Bus.all
    #@orders = Order.all
  end

  def create
    @bus = Bus.new(bus_params)
    @order = Order.find(params[:order_id]) if params[:order_id].present?
    @ordered_bus = Bus.find(params[:bus_id]) if params[:bus_id].present?
    @line = Line.find(params[:line_id]) if params[:line_id].present?
    if @order.present? && !@ordered_bus.present?
      @bus.statut2 = "A commander"  # statut2 force à "a commander" car bus indisponible en stock
      if @bus.save
        redirect_to new_order_bus_line_path(@order, @bus.id)
      else
        render :new
      end
    elsif @order.present? && @ordered_bus.present?
      @bus.facture_livre! # statut1 forcé à "client " car le bus crée est un VO à reprendre et appartient toujours à son client

      if @bus.save
        redirect_to new_order_bus_line_trade_path(@order, @ordered_bus, @line, @bus.id)
      else
        render :new
      end
    elsif @bus.save
      redirect_to buses_path(@bus)
    else
      render :new
    end
  end

  def edit
    @bus = bus.find(params[:id])
  end

  def update
    @bus = Bus.find(params[:id])
    @bus.update(bus_params)
    redirect_to bus_path(@bus)
  end

  def destroy
    @bus = Bus.find(params[:id])
    id = @bus.orders.last.id
    @bus.destroy
    redirect_to order_path(id)
  end

  def archive
    @buses = @buses = Bus.facture_livre
  end

  private

  def set_documents
    @documents_factory_delivery = [
      "VCR",
      "Document de transport",
      "Delivery Note",
      "Photo livraison usine"
    ]
  end

  def bus_params
    params.require(:bus).permit(
      :statut1,
      :statut2,
      :description_id,
      :type_id,
      :ch_cb,
      :sept_neuf,
      :numero_chassis,
      :reference_usine,
      :designation_configuration,
      :bo_number,
      :date_debut_garantie,
      :kilometrage,
      :date_kilometrage,
      :immatriculation,
      :option_contremarque,
      :option_commercial,
      :date_option,
      :prix_mini,
      :version,
      :implantation,
      :longueur,
      :nbr_places,
      :couleur,
      :volo_coach_line,
      :note,
      :reference,
      factory_orders_attributes: [
        :id,
        :envoiOF,
        :date_limit_modif_config,
        :reception_oc,
        :dispo_fr,
        :CDD,
        :_destroy,
        :lieu_depart_usine,
        :date_depart_usine,
        :lieu_arrivee_partenaire_volvo,
        :date_arrivee_partenaire_volvo,
        :partenaire_prevenu
        ],
      ferries_attributes: [
        :id,
        :date_convoyage,
        :depart,
        :arrivee,
        :sens,
        :site,
        :numero_bdc,
        :note
        ]
     )
  end
end

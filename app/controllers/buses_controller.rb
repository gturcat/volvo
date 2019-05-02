class BusesController < ApplicationController
  def index
    session[:order_id] = nil
    @descriptions = Description.all
    @types = Type.all
    @orders = Order.all
    @buses = Bus.all
  end

  def show
    session[:delivery_id] = nil
    session[:order_id] = nil
    @bus = Bus.find(params[:id])
    session[:bus_id] = @bus.id

    if @bus.deliveries.last.present?
      @delivery = @bus.deliveries.last
    else
      @bus.deliveries.build
      @delivery = @bus.deliveries.last
      @delivery.save
    end

    if @bus.factory_orders.last.present?
      @factory_order = @bus.factory_orders.last
    else
      @bus.factory_orders.build
    end

      @bus.ferries.build
      @line = @bus.lines.last
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
      @bus.status2 = "A commander"  # status2 force à "a commander" car bus indisponible en stock
      if @bus.save
        redirect_to new_order_bus_line_path(@order, @bus.id)
      else
        render :new
      end
    elsif @order.present? && @ordered_bus.present?
      @bus.status2 = "VO à rentrer" # status2 force à "En stock VO " car le bus crée est un VO repris
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

  private

  def bus_params
    params.require(:bus).permit(
      :status1,
      :status2,
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
          ],
        deliveries_attributes: [
          :id,
          :lieu_prepa,
          :place_id,
          :date_livraison,
          :heure_livraison,
        ]
     )
  end
end

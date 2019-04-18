class BusesController < ApplicationController
  def index
    @descriptions = Description.all
    @types = Type.all
    @buses = Bus.all
    @orders = Order.all
  end

  def show
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
    @buses = Bus.all
    @orders = Order.all
  end

  def create
     @bus = Bus.new(bus_params)
     if @bus.save
      redirect_to buses_new_path
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

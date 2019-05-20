class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @descriptions = Description.all
    @types = Type.all
    @orders = Order.where(statut: true)
  end

  def new
    @order = Order.new
    @sales_advisors = SalesAdvisor.all
    @order_books = OrderBook.all
  end

  def create
    @order = Order.new(order_params)
    @order.statut = true
    if @order.save
      redirect_to order_path(@order[:id])
    else
      render :new
    end
  end

  def show
    @ordered_buses = @order.buses
    session[:order_id] = @order.id
    @bus = Bus.new
    @descriptions = Description.all
    @types = Type.all
    @buses = []
    @q = Bus.ransack(params[:q])
    if params[:q].present?
      search_stock if params[:q][:description_name_cont].present?
    end
    @order_to_close = true if order_to_close?
  end

  def edit
  end

  def update
    @order.update(order_params)
    redirect_to order_path(@order[:id])
  end

  def destroy
    # efface toutes les reprises
    erase_all_trade
    # le bus commandé est rendu disponible pour une autre commande
    set_bus_to_available
    erase_all_line
    @order.save
    @order.delete
    redirect_to orders_path
  end

  def archive
    @descriptions = Description.all
    @types = Type.all
    @orders = Order.where(statut: false)
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_to_close?
    answer = true
    answer = false unless @ordered_buses.present?
    @ordered_buses.each do |bus|
      answer = false if bus.statut1 != "client"
    end
    @order.lines.each do |line|
      if line.trade.present?
        # le status d'un trade est passé a false quand la reprise est cloturée
        answer = false if line.trade.status == false
      end
    end
    return answer
  end

  def erase_all_trade
    @order.trades.each do |trade|
      #le bus repris est rendu au client
      trade.documents.each do |document|
        document.delete
      end
      bus = trade.bus
      bus.statut1 = "client"
      bus.statut2 = ""
      bus.save
      trade.delete
    end
  end

  def set_bus_to_available
    @order.buses.each do |bus|
      bus.statut1 = "disponible"
      bus.save
    end
  end

  def erase_all_line
    @order.lines.each do |line|
      delivery = line.delivery
      # efface le bus si commandé uniquement pour cette commande
      bus_to_delete = line.bus if line.bus.statut2 == "A commander"
      line.delete
      delivery.documents.each do |document|
        document.delete
      end
      delivery.delete
      bus_to_delete.factory_orders.last.documents.each do |document|
        document.delete
      end
      bus_to_delete.delete if bus_to_delete.present?
    end
  end

  def search_stock
    @buses = @q.result.where(statut1: "disponible").includes(:description)
  end

  def order_params
    params.require(:order).permit(
      :client,
      :numero_bon_de_commande,
      :date,
      :sales_advisor_id,
      :statut
    )
  end

  def bus_params
    params.require(:bus).permit(
      :description_id,
      :statut1,
      :statut2,
      lines_attributes: [
        :id,
        :couleur_ext_vehicule,
        :order_id,
        :order_book_id,
        :date_livraison_bdc,
        :mention_telematique,
        :mention_garantie,
        :_destroy
      ]
    )
  end
end


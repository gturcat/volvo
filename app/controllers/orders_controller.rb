class OrdersController < ApplicationController
  def new
    @order = Order.new
    @sales_advisors = SalesAdvisor.all
    @order_books = OrderBook.all
  end

  def index
    @descriptions = Description.all
    @types = Type.all
    @orders = Order.where(statut: true)
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
    @order = Order.find(params[:id])
    @ordered_buses = @order.buses
    session[:order_id] = @order.id
    @bus = Bus.new
    @descriptions = Description.all
    @types = Type.all
    @buses =[]
    @q = Bus.ransack(params[:q])
    if params[:q].present?
      search_stock if params[:q][:description_name_cont].present?
    end
    @order_to_close = true if order_to_close?
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to order_path(@order[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    # efface toutes les reprises
    erase_all_trade
    # le bus commandé est rendu disponible pour une autre commande
    set_bus_to_available
    erase_all_line
    @order.save
    @order.delete
    redirect_to orders_path
  end

  private

  def order_to_close?
    answer = true
    answer = false if !@ordered_buses.present?
    @ordered_buses.each do |bus|
      answer = false if bus.statut1 != "client"
    end
    @order.lines.each  do |line|
      if line.trade.present?
      answer = false if line.trade.status = false # le status d'un trade est passé a false quand la reprise est cloturée
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
      delivery.delete
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

  # def create_new_bus
  #   @bus = Bus.new(bus_params)
  #   if @bus.save
  #     redirect_to order_path(@order[:id])
  #   else
  #     render :show
  #   end
  # end

  # def associate
  #   @bus = Bus.find(params[:format])
  #   @line = @bus.lines.build
  #   @line.order = @order
  #   @bus.statut1 = "indisponible"
  #   @bus.save
  #   if @line.save
  #     redirect_to order_path(@order[:id])
  #   else
  #     render :show
  #   end
  # end
end


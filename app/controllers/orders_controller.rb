class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]


  def index
    @descriptions = Description.all
    @types = Type.all
    @orders = Order.pending
  end

  def new
    @order = Order.new
    @sales_advisors = SalesAdvisor.all
    @order_books = OrderBook.all
  end

  def create
    @order = Order.new(order_params)
    @order.pending!
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
      search_stock if params[:q][:type_name_cont].present?
    end
    @order_to_close = true if order_to_close?
  end

  def edit
  end

  def archive
    @descriptions = Description.all
    @types = Type.all
    @orders = Order.archive
  end

  def update
    @order.update(order_params)
    redirect_to order_path(@order[:id])
  end

   def bulk_update
    @order = Order.find(params[:id])
    @buses = @order.buses
  end

  def bulk_update_save

  result = Bus.update(params[:buses].keys, params[:buses].values).reject { |p| p.errors.empty? }
  @bus = Bus.find(params[:buses].keys.first)
  @order = @bus.orders.pending.take
    if result.empty?
      flash[:notice] = "Bus updated"
      erase_all_trade
      erase_all_training
      @order.archive!
      redirect_to orders_path
    else
      render :bulk_update
    end
  end

  def closed
    @descriptions = Description.all
    @types = Type.all
    @orders = Order.close
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_to_close?
    answer = true
    answer = false unless @ordered_buses.present?
    @ordered_buses.each do |bus|
      answer = false if bus.facture_livre?
    end
    @order.lines.each do |line|
      line.trades.each do |trade|
        # le status d'un trade est passé a false quand la reprise est cloturée
        answer = false if trade.status == false
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
      bus.facture_livre!
      bus.statut2 = ""
      bus.save
      trade.delete
    end
  end

  def erase_all_training
    @order.trainings.each do |training|
      training.delete
    end
  end

  def set_bus_to_available
    @order.buses.each do |bus|
      bus.disponible!
      bus.save
    end
  end

  def erase_all_line
    @order.lines.each do |line|
      delivery = line.delivery
      # efface le bus si commandé uniquement pour cette commande
      bus_to_cancel = line.bus if line.bus.statut2 == "A commander"
      # delivery.documents.each do |document|
      #   public_id = document.pdf.file.public_id
      #   Cloudinary::Api.delete_resources([public_id], :type => :private)
      #   document.delete
      # end
      delivery.statut = false
      delivery.save
      # if bus_to_delete.present?
      #   if bus_to_delete.factory_orders.last.present?
      #     # bus_to_delete.factory_orders.last.documents.each do |document|
      #     #   public_id = document.pdf.file.public_id
      #     #   Cloudinary::Api.delete_resources([public_id], :type => :private)
      #     #   document.delete
      #     end
      #     factory_order = line.bus.factory_orders.last
      #     factory_order.delete
      # end

      if bus_to_cancel.present?
        bus_to_cancel.statut2 = "Annulé"
        bus_to_cancel.save
      end
    end
  end

  def search_stock
    @buses = @q.result.where(statut1: ["indisponible","disponible"]).includes(:type)
  end

  def order_params
    params.require(:order).permit(
      :client,
      :numero_bon_de_commande,
      :date,
      :sales_advisor_id,
      :statut,
      :departement
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


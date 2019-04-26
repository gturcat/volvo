class OrdersController < ApplicationController
  def new
    @order = Order.new
    @sales_advisors = SalesAdvisor.all
    @order_books = OrderBook.all
  end

  def index
    @descriptions = Description.all
    @types = Type.all
    @orders = Order.all
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to order_path(@order[:id])
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
    @bus = Bus.new
    @descriptions = Description.all
    @types = Type.all
    @q = Bus.ransack(params[:q])
    @buses = @q.result.where(status1: "disponible").includes(:description)
    @orders = Order.all
    @bus.lines.build
    create_new_bus if params[:bus].present?
    associate if params[:format].present?
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
     @order.destroy
     redirect_to orders_path
  end

private

  def order_params
    params.require(:order).permit(
      :client,
      :numero_bon_de_commande,
      :date,
      :sales_advisor_id
    )
  end

  def bus_params
    params.require(:bus).permit(
      :description_id,
      :status1,
      :status2,
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

  def create_new_bus
    @bus = Bus.new(bus_params)
    if @bus.save
      redirect_to order_path(@order[:id])
    else
      render :show
    end
  end

  def associate
    @bus = Bus.find(params[:format])
    @line = @bus.lines.build
    @line.order = @order
    @bus.status1 = "indisponible"
    @bus.save
    if @line.save
      redirect_to order_path(@order[:id])
    else
      render :show
    end

  end

end


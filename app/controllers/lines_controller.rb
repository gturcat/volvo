class LinesController < ApplicationController
  def edit
    @line = Line.find(params[:id])
  end

  def update
    @line = Line.find(params[:id])
    @line.update(line_params)
    redirect_to bus_path(@line.bus)
  end

  def destroy
    @line = Line.find(params[:id])
    @order = @line.order
    @bus = @line.bus
    @bus.status1 = "disponible"
    @bus.save
    @line.delete
    redirect_to order_path(@order)
  end

  def new
    @order = Order.find(params[:order_id])
    @bus = Bus.find(params[:bus_id])
    @line = Line.new
  end

  def create
    @line = Line.new(line_params)
    @line.order = Order.find(params[:order_id])
    @order = @line.order
    @bus = @line.bus
    @bus.status1 = "indisponible"
    @bus.save
    if @line.save
      @line.reprise ? (redirect_to new_order_bus_line_trade_path(@order, @bus, @line)) : (redirect_to order_path(@order))
    else
      render :new
    end
  end

  private

  def line_params
    params.require(:line).permit(
      :bus_id,
      :id,
      :order_book_id,
      :couleur_ext_vehicule,
      :mention_garantie,
      :mention_telematique,
      :garantie_pep_tool,
      :telematique_demandee,
      :date_livraison_bdc,
      :reprise,
      :order_id
    )
  end
end

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
    @bus = Bus.find(params[:format])
    @line = Line.new
  end

  def create
    @order = Order.find(params[:order_id])
    @line = Line.new(line_params)
    @bus = @line.bus
    @bus.status1 = "indisponible"
    @bus.save
    @line.order = @order
    if @line.save
      redirect_to order_path(@order)
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
      :type_commande
    )
  end
end

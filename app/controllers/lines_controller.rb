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
    # efface la livraison
    delivery_to_delete = @line.delivery
    @line.delivery = nil
    @line.save

    # efface l'eventuelle reprise
    trade = @line.trade
      #le bus repris est rendu au client
    if trade.present?
      traded_bus = trade.bus
      traded_bus.statut1 = "client"
      traded_bus.statut2 = ""
      traded_bus.save
      trade.delete
    end

    # efface l'enventuelle formation
    training = @line.training
    training.delete if training.present?

    # le bus commandé est rendu disponible pour une autre commande
    bus = @line.bus
    bus.statut1 = "disponible"
    bus.save
    @line.delete
    delivery_to_delete.delete
    # efface le bus si commandé pour l'occasion
    if bus.statut2 == "A commander"
      bus.delete
    end
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
    @bus.statut1 = "indisponible"
    @bus.save
    #creation de la livraison correspondante
    @delivery = Delivery.create(statut: true)

    @line.delivery_id = @delivery.id

    if @line.save
      redirect_to order_path(@order)
    else
      render :new
    end
  end

  private

  def delete_trade
    traded_bus = trade.bus
    traded_bus.delete
    trade.delete
  end

  def line_params
    params.require(:line).permit(
      :bus_id,
      :id,
      :order_book_id,
      :couleur_ext_vehicule,
      :mention_garantie,
      :mention_telematique,
      :date_livraison_bdc,
      :order_id,
      :financement_type,
      :delivery_id
    )
  end
end

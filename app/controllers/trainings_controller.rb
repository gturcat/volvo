class TrainingsController < ApplicationController
  def new
    @ordered_bus = Bus.find(params[:bus_id])
    @order = Order.find(params[:order_id])
    @line = Line.find(params[:line_id])
    @training = Training.new
  end

  def create
    @training = Training.new(trade_params)
    if @training.save
      redirect_to order_path(@training.line.order)
    else
      render :new
    end
  end

  def destroy
    @training = Training.find(params[:id])
    @line = @training.line
    @order = @line.order
    @training.delete
    redirect_to order_path(@order)
  end

  private

  def trade_params
    params.require(:training).permit(
      :date,
      :lieu,
      :formateur,
      :order_id,
      :line_id,
      :bus_id
    )
  end
end

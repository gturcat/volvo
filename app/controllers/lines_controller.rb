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


  private

  def line_params
    params.require(:line).permit(
      :id,
      :mention_garantie,
      :mention_telematique,
      :garantie_pep_tool,
      :telematique_demandee
    )
  end
end

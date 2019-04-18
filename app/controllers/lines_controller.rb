class LinesController < ApplicationController
  def edit
    @line = Line.find(params[:id])
  end

  def update
    @line = Line.find(params[:id])
    @line.update(line_params)
    redirect_to bus_path(@line.bus)
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

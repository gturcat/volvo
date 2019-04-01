class DocumentsController < ApplicationController
  def show
  @bus = Bus.find(session[:bus_id])
  @document = @bus.factory_orders.last.documents.last
  end

  def new
    @document = Document.new
  end

  def create
    @bus = Bus.find(session[:bus_id])
    session[:bus_id] = nil
    @document = Document.new(document_params)
    @document.factory_order = @bus.factory_orders.last
    if @document.save
      redirect_to bus_path(@bus[:id])
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def bus_params
    params.require(:bus).permit(:id)
  end

  def document_params
    params.require(:document).permit(:id, :name, :pdf)
  end

end

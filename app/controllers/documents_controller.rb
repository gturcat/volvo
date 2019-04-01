class DocumentsController < ApplicationController
  def show
  @bus = Bus.find(session[:bus_id])
  @document = @bus.factory_orders.last.documents.where(name: params[:name]).take
  end

  def new
    @name = params[:name]
    @bus = Bus.find(session[:bus_id])
    if @bus.factory_orders.last.documents.where(:name => @name).take.present?
       edit
    else
      @document = Document.new
      @document.name = @name
    end
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
    @document = @bus.factory_orders.last.documents.where(name: params[:name]).take
  end

  def update
    @name = params[:name]
    @bus = Bus.find(session[:bus_id])
    @document = @bus.factory_orders.last.documents.where(:name => document_params[:name]).take
    @document.update(document_params)
    redirect_to document_path(@bus, :name => @document.name)
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

class DocumentsController < ApplicationController
  def show
  @photo = params[:photo]
  @bus = Bus.find(session[:bus_id]) if session[:bus_id].present?
  @delivery = Delivery.find(session[:delivery_id]) if session[:delivery_id].present?
  @trade = Trade.find(session[:trade_id]) if session[:trade_id].present?
   @document = Document.find(params[:id])
  @pages = Cloudinary::Api.resource(@document.pdf.file.public_id,:type=>"private", :pages => true)["pages"]
  end

  def new
    @name = params[:name]
    @bus = Bus.find(session[:bus_id]) if session[:bus_id].present?
    @delivery = Delivery.find(session[:delivery_id]) if session[:delivery_id].present?
    @trade = Trade.find(session[:trade_id]) if session[:trade_id].present?

    if @bus.present?
      if @bus.factory_orders.last.documents.where(:name => @name).take.present?
        edit
      else
        @document = Document.new
        @document.name = @name
      end
    end

    if @delivery.present?
      if @delivery.documents.where(name: params[:name]).take.present?
        edit
      else
        @document = Document.new
        @document.name = @name
      end
    end

    if @trade.present?
      if @trade.documents.where(name: params[:name]).take.present?
        edit
      else
        @document = Document.new
        @document.name = @name
      end
    end

  end

  def create
    @bus = Bus.find(session[:bus_id]) if session[:bus_id].present?
    @delivery = Delivery.find(session[:delivery_id]) if session[:delivery_id].present?
    @trade = Trade.find(session[:trade_id]) if session[:trade_id].present?
    session[:bus_id] = nil
    session[:delivery_id] = nil
    session[:trade_id] = nil
    @document = Document.new(document_params)
    @document.factory_order = @bus.factory_orders.last if @bus.present?
    @document.delivery = @delivery if @delivery.present?
    @document.trade = @trade if @trade.present?
    if @document.save && @document.pdf != nil && @bus.present?
      redirect_to bus_path(@bus[:id])
    elsif @document.save && @document.pdf != nil && @delivery.present?
      redirect_to delivery_path(@delivery[:id])
    elsif @document.save && @document.pdf != nil && @trade.present?
      redirect_to delivery_path(@trade[:id])
    else
      render :new
    end
  end

  def edit
    @document = Document.find(params[:id])
    @trade = Trade.find(session[:trade_id]) if session[:trade_id].present?
  end

  def update
    @name = params[:name]
    @bus = Bus.find(session[:bus_id]) if session[:bus_id].present?
    @delivery = Delivery.find(session[:delivery_id]) if session[:delivery_id].present?
    @trade = Trade.find(session[:trade_id]) if session[:trade_id].present?
    session[:bus_id] = nil
    session[:delivery_id] = nil
    session[:trade_id] = nil
    @document = Document.find(params[:id])
    @document.update(document_params)
    redirect_to bus_path(@bus) if @bus.present?
    redirect_to delivery_path(@delivery) if @delivery.present?
    redirect_to trade_path(@trade) if @trade.present?
  end

  def destroy
    @name = params[:name]
    @bus = Bus.find(session[:bus_id]) if session[:bus_id].present?
    @delivery = Delivery.find(session[:delivery_id]) if session[:delivery_id].present?
    @trade = Trade.find(session[:trade_id]) if session[:trade_id].present?
    session[:bus_id] = nil
    session[:delivery_id] = nil
    session[:trade_id] = nil
    @document = Document.find(params[:id])
    public_id = @document.pdf.file.public_id
    Cloudinary::Api.delete_resources([public_id], :type => :private)
    @document.delete
    redirect_to bus_path(@bus) if @bus.present?
    redirect_to delivery_path(@delivery) if @delivery.present?
    redirect_to trade_path(@trade) if @trade.present?
  end

  private

  def bus_params
    params.require(:bus).permit(:id)
  end

  def delivery_params
    params.require(:delivery).permit(:id)
  end

  def trade_params
    params.require(:trade).permit(:id)
  end

  def document_params
    params.require(:document).permit(:id, :name, :pdf)
  end

end

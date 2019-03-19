class BusesController < ApplicationController
  def new
    @bus = Bus.new
    @descriptions = Description.all
    @types = Type.all
    @buses = Bus.all
  end

  def create
     @bus = Bus.new(bus_params)
     if @bus.save

      redirect_to buses_new_path
     else
     render :new
   end
  end

private

def bus_params
  params.require(:bus).permit(:status1, :status2, :description_id, :type_id, :ch_cb, :sept_neuf)
end

end

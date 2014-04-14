class CarsController < ApplicationController

  def index
    @car = Car.new
    @manufacturer = Manufacturer.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to cars_path, notice: 'Car Information Created'
    else
      flash.now[:alert] = 'Invalid Information'
      render :index
    end
  end

  private

  def car_params
    params.require(:car).permit(:color, :year, :mileage, :description)
  end

end

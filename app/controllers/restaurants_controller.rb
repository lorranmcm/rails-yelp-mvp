class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    set_restaurant
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    restaurant = Restaurant.new(restaurant_params)
    restaurant.save
    redirect_to restaurants_path
  end

  private

  # para usar com o before action
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  # autoriza a informacao que vem do formulario, por requisitos de seguranca
  def restaurant_params
    params.require(:restaurant).permit(:name, :phone_number, :category, :address)
  end
end

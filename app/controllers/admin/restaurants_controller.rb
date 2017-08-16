class Admin::RestaurantsController < ApplicationController
  before_action :check_admin
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    if @restaurant.save
      redirect_to admin_restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def show
  end

  def update
    @restaurant.update(restaurant_params)
    redirect_to admin_restaurant_path(@restaurant)
  end

  def destroy
    @restaurant.destroy
    redirect_to admin_restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def check_admin
    redirect_to root_path unless current_user.admin
  end
end

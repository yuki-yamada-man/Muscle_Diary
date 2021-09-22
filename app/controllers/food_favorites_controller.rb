class FoodFavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @food = Food.find(params[:food_id])
    @food_favorite = @food.food_favorites.new(user_id: current_user.id)
    @food_favorite.save
    redirect_to request.referer
  end

  def destroy
    @food = Food.find(params[:food_id])
    @food_favorite = @food.food_favorites.find_by(user_id: current_user.id)
    @food_favorite.destroy
    redirect_to request.referer
  end

end

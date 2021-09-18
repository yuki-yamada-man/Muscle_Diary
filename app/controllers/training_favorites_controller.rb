class TrainingFavoritesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @training = Training.find(params[:training_id])
    favorite = @training.favorites.new(user_id:current_user.id)
    favorite.save
    redirect_to request.referer
  end
  
  def destroy
    @training = training.find(params[:training_id])
    favorite = @taining.favorites.find_by(user_id:current_user.id)
    favorite.destroy
    redirect_to request.referer
  end
end

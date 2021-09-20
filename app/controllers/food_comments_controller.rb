class FoodCommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @food = Food.find(params[:food_id])
    @food_comment = FoodComment.new(food_comment_params)
    @food_comment.food_id = @food.id
    @food_comment.user_id = current_user.id
    if @food_comment.save
      redirect_to food_path(@food.id)
    else
      render 'foods/show'
    end
  end
  
  def destroy
    @food = Food.find(params[:food_id])
    @food_comment = @food.food_comment.find(params[:id])
    @food_comment.destroy
    redirect_to request.referer
  end
  
  private
  
  def food_comment_params
    params.require(:food_comment).permit(:comment)
  end
end

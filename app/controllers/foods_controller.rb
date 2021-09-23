class FoodsController < ApplicationController
  before_action :authenticate_user!

  def new
    @food = Food.new
  end

  def create
    @food_new = Food.new(food_params)
    @food_new.user_id = current_user.id
    if @food_new.save
      #redirect_to food_path(@food_new.id),notice:'You have created food successfully!'
      render 'schedule.js.erb'
    else
      @training_new = Training.new
      @foods = Foods.all
      render :index
    end
  end

  def index
    @training_new = Training.new
    @food_new = Food.new
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
    @user = User.find_by(id: @food.user_id)
    @training_new = Training.new
    @food_new = Food.new
    @food_comments = FoodComment.all
    @food_comment =FoodComment.new
  end

  def edit
    @food = Food.find(params[:id])
    @training_new = Training.new
    @food_new = Food.new
  end

  def update
    @food = Food.find(params[:id])
    if @food.update(food_params)
      redirect_to food_path(@food.id),notice:'You have updated food successfully!'
    else
      render :edit
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:start_time,:menu)
  end

end

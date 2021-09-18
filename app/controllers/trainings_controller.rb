class TrainingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @training = Training.new
  end

  def create
    @training_new = Training.new(training_paraams)
    @training_new.user_id = current_user.id
    if @training_new.save
      redirect_to training_path(@training_new.id),notice:'You have created training succussfuly!'
    else
      @food_new = Food.new
      @training = Training.all
      render :index
    end
  end

  def index
    @training_new = Training.new
    @food_new = Food.new
    @trainings = training.all
  end

  def show
    @training = Training.find(params[:id])
    @training_new = Training.new
    @food_new = Food.new
    @training_comment = TraininngComment.new
  end

  def edit
    @training = Training.find(params[:id])
    @training_new = Training.new
    @food_new = Food.new
  end

  def update
    @training = Training.find(params[:id])
    if @training.update(training_params)
      redirect_to training_path(@training.id),notice:'You have updated training successfully!'
    else
      render :edit
    end
  end

  def destroy
    @training = Training.find(params[:id])
    @training.destroy
    redirect_to trainings_path
  end

  private

  def training_params
    params.require(:training).permit(:menu,:kg,:count,:set,:date)
  end

end

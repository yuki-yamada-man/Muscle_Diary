class TrainingCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @training = Training.find(params[:training_id])
    @training_comment = TrainingComment.new(training_comment_params)
    @training_comment.training_id = @training.id
    @training_comment.user_id = current_user.id
    if @training_comment.save
      redirect_to training_path(@training.id)
    else
      render 'trainings/show'
    end
  end

  def destroy
    @trainng = Training.find(params[:training_id])
    @training_comment = @training.training_comment.find(params[:id])
    @training_comment.destroy
  end

  private

  def training_comment_params
    params.require(:training_comment).permit(:comment)
  end

end

class SearchsController < ApplicationController

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    @records = search_for(@model, @content, @method)
  end

  private

  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      elsif search == 'forward_match'
        User.where("name LIKE?", content+'%')
      elsif search =='backward_match'
        User.where("name LIKE?", '%'+content)
      else
        User.where("name LIKE", '%'+content+'%')
      end
    elsif model == 'training'
      if method == 'perfect'
        Training.where(menu: content)
      elsif search == 'forward_match'
        Training.where("menu LIKE?", content+'%')
      elsif search == 'backward_match'
        Training.where("menu LIKE?", '%'+content)
      else
        Training.where("menu LIKE?", '%'+content+'%')
      end
    elsif model == 'food'
      if method == 'perfect'
        Food.where(menu: content)
      elsif search == 'forward_match'
        Food.where("menu LIKE?", content+'%')
      elsif search == 'backward_match'
        Food.where("menu LIKE?", '%'+content)
      else
        Food.where("menu LIKE?", '%'+content+'%')
      end
    end
  end
end

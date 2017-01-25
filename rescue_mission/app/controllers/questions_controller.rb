class QuestionsController < ApplicationController
  def index
    @questions = Question.all.order(:id).reverse
  end

  def show
  end
end

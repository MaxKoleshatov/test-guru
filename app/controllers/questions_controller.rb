class QuestionsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    questions = @test.questions.pluck(:body)
    render plain: questions.join(" ")
  end

  def show
    render plain: @question.body
  end

  def new
  end

  def create
    question = @test.questions.create(questions_params)
    if question.save
    render plain: question.inspect
    else
      new
    end
  end
  
  def destroy
    @question.delete
    render plain: "Destroy"
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def questions_params
    params.require(:question).permit(:body, :test_id)
  end

  def rescue_with_question_not_found
    render plain: "Нет такого вопроса"
  end
end
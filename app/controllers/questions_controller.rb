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
  # test_questions_path(@test)
  def create
    question = @test.questions.build(questions_params)
    if question.save
   redirect_to test_questions_path(@test)
    else
     render 'new'
    end
  end
  
  def destroy
    @question.delete
    render plain: "Question Destroy"
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

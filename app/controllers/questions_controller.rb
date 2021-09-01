class QuestionsController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[edit update show destroy]

  # rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def new
    @question = Question.new
  end
  
  def create
    question = @test.questions.build(questions_params)

    if question.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(questions_params)
      redirect_to @question
    else
      render :edit
    end
  end
  
  def destroy
    @question.destroy

    redirect_to test_path(@question.test)
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

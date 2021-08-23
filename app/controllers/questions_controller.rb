class QuestionsController < ApplicationController
    def index
      @test = Test.find(params[:test_id])
      questions = @test.questions.map do
        |q| q.body
      end
      render plain: questions.join(" ")
    end

    def show
      @test = Test.find(params[:test_id])
      question = Question.find(params[:id])
      render plain: @test.questions[question.id - 1].body

    end
end
# Post.find(params[:id])

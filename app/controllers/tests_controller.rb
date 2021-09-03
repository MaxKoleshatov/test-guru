class TestsController < ApplicationController
  before_action :find_test, only: %i[start show destroy]
  before_action :find_questions, only: %i[show]
  before_action :set_user, only: :start

  def index
   @tests = Test.all
  end

  def show; end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def edit
    @test = Test.find(params[:id])
  end

  def update
    @test = Test.find(params[:id])

    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def destroy
    @test.destroy

    redirect_to tests_path
  end

  def start
    @test = Test.find(params[:id])
    @user.tests.push(@test)
    redirect_to @user.tests_user(@test)
  end

  private

  
  def find_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user = User.first
  end

  def find_questions
    @questions = @test.questions
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end

class TestsController < ApplicationController
  before_action :find_test, only: %i[show]

  def show
    render plain: @test.title
  end

  def new
  end

  private

  
    def find_test
      @test = Test.find(params[:id])
    end
end

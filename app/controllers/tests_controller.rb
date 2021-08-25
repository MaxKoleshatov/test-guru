class TestsController < ApplicationController
  def show
    render json: {tests: Test.first}
  end
  def new
    
  end
end

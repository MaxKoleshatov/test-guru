class TestsUsersController < ApplicationController
  before_action :authenticate_user!

  before_action :set_test_user, only: %i[show update result]

  def show; end

  def result; end

  def update
    @test_user.accept!(params[:answer_ids])

    if @test_user.completed?
      TestsMailer.completed_test(@test_user).deliver_now
      redirect_to result_tests_user_path(@test_user)
    else
      render :show
    end
  end

  private

  def set_test_user
    @test_user = TestsUser.find(params[:id])
  end
end

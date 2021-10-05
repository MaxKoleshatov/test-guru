class GistsController < ApplicationController
  before_action :set_test_user, only: %i[create]

  def set_test_user
    @test_user = TestsUser.find(params[:id])
  end

  def create
    result = GistQuestionService.new(@test_user.current_question).call      
    
    if result.success?
        current_user.gists.create!(question: @test_user.current_question, url: result.url)
        flash[:notice] = "#{I18n.t('.success')} - #{view_context.link_to(I18n.t('.link'), result.url)}"
    else
        flash[:alert] = I18n.t('.failure')
    end
      redirect_to @test_user
  end
end
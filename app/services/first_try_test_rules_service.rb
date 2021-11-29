class FirstTryTestRulesService < AllRulesService
        
  def call
          
    tests_move_user_by_tests = @test_user.user.tests_users.where(test_id: Test.where(title: @options))

    if tests_move_user_by_tests.present?
      tests_move_user_by_tests.first.done? && tests_move_user_by_tests.ids.count == 1
    end
  end  
end
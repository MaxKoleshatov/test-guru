class LevelRulesService < AllRulesService

  def call
          
    completed_tests_by_level = []

    all_tests_level = Test.where(level: @options.to_i).ids

    tests_move_user_by_level = @test_user.user.tests_users.where(test_id: all_tests_level)

    tests_move_user_by_level.each do |test|
      if test.done? && completed_tests_by_level.include?(test.test_id) == false
        completed_tests_by_level << test.test_id
      end
      end
    completed_tests_by_level.count == all_tests_level.count
  end   
end
class CategoryRulesService < AllRulesService
        
  def call
        
    completed_tests_by_category = []

    all_tests_category = Category.find_by(title: @options).tests.ids
        
    all_tests_category_move_user = @test_user.user.tests_users.joins(:test).where(test: {id: all_tests_category})
        
    all_tests_category_move_user.each do |test|
      if test.done? && completed_tests_by_category.exclude?(test.test_id)
        completed_tests_by_category << test.test_id
      end
      end  
    completed_tests_by_category.count == all_tests_category.count
  end  
end
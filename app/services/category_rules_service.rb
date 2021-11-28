class CategoryRulesService < AllRulesService
        
  def call
        
    completed_tests_by_category = []

    all_tests_category = Category.find_by(title: @options).tests.ids
        
    all_tests_category_move_user = @test_user.user.tests_users.joins(:test).where(test: {id: all_tests_category})
        
    all_tests_category_move_user.each do |test|
      if test.done? && completed_tests_by_category.include?(test.test_id) == false
        completed_tests_by_category << test.test_id
      end
      end  
    add_badges if completed_tests_by_category.count == all_tests_category.count
  end  
end
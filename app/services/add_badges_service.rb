module AddBadgesService 

    def check_rules
    #   RULES = {
    #       @category_rule =>  "Прошел все тесты категории",
    #       @first_try_test_rule => "Прошел с первой попытки тест",
    #       @level_rule => "Прошел все тесты уровня"}
    
      Badge.find_each do |badge|
        @badge_rule = badge.rules
        @options = badge.options
        category_rule if @badge_rule == Badge::RULES[:category_rule]
        first_try_test_rule if @badge_rule == Badge::RULES[:first_try_test_rule]
        level_rule if @badge_rule == Badge::RULES[:level_rule]
        end
    end

    def category_rule

      completed_tests_by_category = []

      all_tests_category = Category.find_by(title: @options).tests.ids

      all_tests_category_move_user = current_user.tests_users.joins(:test).where(test: {id: all_tests_category})

      all_tests_category_move_user.each do |test|
        if test.done? && completed_tests_by_category.include?(test.test_id) == false
          completed_tests_by_category << test.test_id
        end
      end

      add_badges if completed_tests_by_category.count == all_tests_category.count
    end

    def first_try_test_rule
      tests_move_user_by_tests = current_user.tests_users.where(test_id: Test.where(title: @options))

      if tests_move_user_by_tests.present?
        add_badges if tests_move_user_by_tests.first.done? && tests_move_user_by_tests.ids.count == 1
      end
    end

    def level_rule

      completed_tests_by_level = []

      all_tests_level = Test.where(level: @options.to_i).ids

      tests_move_user_by_level = current_user.tests_users.where(test_id: all_tests_level)

      tests_move_user_by_level.each do |test|
        if test.done? && completed_tests_by_level.include?(test.test_id) == false
          completed_tests_by_level << test.test_id
          end
        end
        add_badges if completed_tests_by_level.count == all_tests_level.count
    end

    def add_badges
      if current_user.users_badges.where(badge_id: Badge.where(rules: @badge_rule, options: @options)).present? != true
        UsersBadge.create!(user_id: current_user.id, badge_id: Badge.where(rules: @badge_rule, options: @options).first.id)
      end
    end
end
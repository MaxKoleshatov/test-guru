class AddBadgesService
  
  def initialize(test_user)
    @test_user = test_user
  end

  RULES = {category_rule: CategoryRulesService,
           first_time_rule: FirstTryTestRulesService,
           level_rule: LevelRulesService}.freeze

  def call
    Badge.find_each do |badge|
      @badge_rule = badge.rules
      @options = badge.options
    add_badges if RULES[badge.rules.to_sym].new(@test_user, @badge_rule, @options).call
    end
  end

  def add_badges
    if @test_user.user.users_badges.where(badge_id: Badge.where(rules: @badge_rule, options: @options)).present? != true
      UsersBadge.create!(user_id: @test_user.user.id, badge_id: Badge.where(rules: @badge_rule, options: @options).first.id)
    end
  end
end
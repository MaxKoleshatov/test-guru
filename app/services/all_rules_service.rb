class AllRulesService

  def initialize(test_user, badge_rule, options)
    @test_user = test_user
    @badge_rule = badge_rule
    @options = options
  end

  def add_badges
    if @test_user.user.users_badges.where(badge_id: Badge.where(rules: @badge_rule, options: @options)).present? != true
      UsersBadge.create!(user_id: @test_user.user.id, badge_id: Badge.where(rules: @badge_rule, options: @options).first.id)
    end
  end
end 
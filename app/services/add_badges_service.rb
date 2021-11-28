class AddBadgesService
  
  def initialize(test_user)
    @test_user = test_user
  end

  RULES = {I18n.t(".category_rule") => CategoryRulesService,
           I18n.t(".first_time_rule") => FirstTryTestRulesService,
           I18n.t(".level_rule") => LevelRulesService}.freeze

  def call
    Badge.find_each do |badge|
      @badge_rule = badge.rules
      @options = badge.options
    RULES[badge.rules].new(@test_user, @badge_rule, @options).call
    end
  end
end
require 'test_helper'

class AchievementsControllerTest < ActionController::TestCase
  def setup
    @admin_user = users(:test_site_admin)
    @sample_achievement = achievements(:sample_achievement)
  end
end

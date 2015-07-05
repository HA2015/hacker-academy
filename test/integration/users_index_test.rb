require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin     = users(:test_site_admin)
    @non_admin = users(:test_basic_user)
  end

  test "index" do
    get users_path
    assert_template 'users/index'
  end

  test "index as admin including delete links" do
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    users = User.all
    users.each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
      unless user == @admin
        assert_select 'a[href=?]', user_path(user), text: 'delete'
      end
    end
    assert_difference 'User.count', -1 do
      delete user_path(@non_admin)
    end
  end
end

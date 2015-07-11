require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  def setup
    @admin_user = users(:test_site_admin)
    @sponsor_user = users(:test_sponsor_user)
    @other_user = users(:test_basic_user)
    @sample_event = events(:sample_event)
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @sample_event
    assert_redirected_to root_url
  end

  test "should redirect edit when not logged in as admin" do
    log_in_as @other_user
    get :edit, id: @sample_event
    assert_redirected_to root_url
    log_in_as @sponsor_user
    get :edit, id: @sample_event
    assert_redirected_to root_url 
  end

  test "should redirect new when not logged in" do
    get :new
    assert_redirected_to root_url
  end

  test "should redirect new when logged in as regular user" do
    log_in_as @other_user
    get :new
    assert_redirected_to root_url
  end

  test "should redirect update when not logged in" do
    patch :update, id: @sample_event, event: { name: ""}
    assert_redirected_to root_url
  end

  test "should redirect update when not logged in as admin" do
    log_in_as @other_user
    patch :update, id: @sample_event, event: { name: ""}
    assert_redirected_to root_url
    log_in_as @sponsor_user
    patch :update, id: @sample_event, event: { name: ""}
    assert_redirected_to root_url
  end

  # This test might need to be refactored
  #   If non-admins become able to edit events (as an unintentional regression), 
  #   it is possible that this test will cause an error, not a failure
  test "should redirect destroy when not logged in as admin" do
    assert_no_difference 'Event.count' do
      delete :destroy, id: @sample_event
    end
    assert_redirected_to root_url
    log_in_as(@other_user)
    assert_no_difference 'Event.count' do
      delete :destroy, id: @sample_event
    end
    assert_redirected_to root_url
  end

  # Tests that would be appreciated/useful
  # - Friendly fowarding (to index) with edit
  # - Friendly forwarding with delete
  # Please keep in mind that tests that do not interact solely with the event_controller
  #  should not be in this file. An example of such a test is one that checks the view

end

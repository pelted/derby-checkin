require 'test_helper'

class RacesControllerTest < ActionDispatch::IntegrationTest
  include Oath::Test::Helpers

  setup do
    @race = races(:main_race)
    @admin = users(:admin_user)
    sign_in @admin
  end

  test "should get index" do
    get races_url
    assert_response :success
  end

  test "should get new" do
    get new_race_url
    assert_response :success
  end

  test "should create race" do
    assert_difference('Race.count') do
      post races_url, params: { race: { date: @race.date, description: @race.description, location: @race.location, rules: @race.rules, slug: @race.slug, time: @race.time, title: @race.title } }
    end

    assert_redirected_to race_url(Race.last)
  end

  test "should show race" do
    get race_url(@race)
    assert_response :success
  end

  test "should get edit" do
    get edit_race_url(@race)
    assert_response :success
  end

  test "should update race" do
    patch race_url(@race), params: { race: { date: @race.date, description: @race.description, location: @race.location, rules: @race.rules, slug: @race.slug, time: @race.time, title: @race.title } }
    assert_redirected_to race_url(@race)
  end

  test "should destroy race" do
    assert_difference('Race.count', -1) do
      delete race_url(@race)
    end

    assert_redirected_to races_url
  end
end

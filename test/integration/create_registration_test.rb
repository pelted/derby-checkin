require 'test_helper'

class CreateRegistraionTest < ActionDispatch::IntegrationTest
  setup do
    @race = races(:main_race)
  end

  test 'can create a registration' do
    get new_race_registration_url(race_id: @race.id)  
    assert_response :success

    post race_registrations_url, params: { registration: { first_name: 'Penelope', car_name: 'Pink Lemonade', contact_name: 'Mrs. Pink', contact_email: 'pink_pokadots@example.com' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
  end

  test 'shows validation errors on form fields' do
    get new_race_registration_url(race_id: @race.id)  
    assert_response :success
    post race_registrations_url, params: { registration: { car_name: ''} }
    assert_response :success
    assert_select '#error_explanation' do
      assert_select 'h2', '5 errors prohibited this registration from being saved.'
    end
  end
end
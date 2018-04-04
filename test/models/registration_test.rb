require 'test_helper'

class RegistrationTest < ActiveSupport::TestCase
  setup do
    @race = races(:main_race)
  end

  test 'can create register a new entry' do
    reg = Registration.new(
      race: @race,
      first_name: 'Penelope',
      car_name: 'Pink Lemonade',
      contact_name: 'Mrs. Pink',
      contact_email: 'pink_pokadots@example.com'
    )
    assert_difference "Entry.count", 1 do
      reg.save
    end
  end

  test 'registration is not valid' do
    reg = Registration.new(
      race: @race,
    )
    refute reg.valid?
    
    assert_includes reg.errors, :first_name
    assert_includes reg.errors, :car_name
    assert_includes reg.errors, :contact_name
    assert_includes reg.errors, :contact_email
    assert_includes reg.errors, :contact_phone
  end
end
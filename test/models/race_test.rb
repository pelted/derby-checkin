require 'test_helper'

class RaceTest < ActiveSupport::TestCase
  setup do
    @main = races(:main_race)
    @district = races(:district_race)
  end

  test 'valid fixtures' do
    assert @main.valid?
    assert @district.valid?
  end

  test 'can create a new race' do
    assert_difference "Race.count", 1 do
      Race.create! do |r|
        r.title = 'New Race'
        r.location = 'A String To Nowhere'
      end
    end
  end
end

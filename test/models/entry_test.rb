require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  setup do
    @race = races(:main_race)
  end

  test 'can create a new entry' do
    racer = Racer.create(first_name: 'Jeffory', last_name: 'Light')
    assert_difference "Entry.where(race_id: @race.id).maximum(:order)", 1 do
      entry = Entry.create(race: @race, racer: racer, car_name: 'The Flash')
    end
  end

  test 'not valid if order is repeated' do
    entry = entries(:bear_entry)
    assert_raises ActiveRecord::RecordNotUnique do
      refute entry.update(order: 1)
    end
  end
end

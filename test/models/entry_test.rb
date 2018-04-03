require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  setup do
    @race = races(:main_race)
  end

  test 'can create a new entry' do
    racer = Racer.create(first_name: 'Jeffory', last_name: 'Light')
    assert_difference "Entry.where(race_id: @race.id).maximum(:order)", 1 do
      Entry.create(race: @race, racer: racer, car_name: 'The Flash', contact_name: 'Luie Cobbler', contact_email: 'lc@example.com')
    end
  end

  test 'not valid if duplicate entry' do
    racer = racers(:bear_scout)
    entry = Entry.create(race: @race, racer: racer, car_name: 'Copy and Paste')
    refute entry.valid?
  end

  test 'can update existing entry' do
    entry = entries(:den_leader_entry)
    assert entry.update(status: 1)
    assert_equal 1, entry.status
  end
end


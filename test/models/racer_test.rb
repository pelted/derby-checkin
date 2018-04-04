require 'test_helper'

class RacerTest < ActiveSupport::TestCase
  test 'valid fixtures' do
    assert racers(:wolf_scout).valid?
    assert racers(:bear_scout).valid?
    assert racers(:sibling).valid?
    assert racers(:den_leader).valid?    
  end
end

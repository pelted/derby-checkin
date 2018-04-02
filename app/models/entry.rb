class Entry < ApplicationRecord
  belongs_to :race
  belongs_to :racer

  before_create :set_race_order

  private

  def set_race_order
    last_order = Entry.where(race_id: race).maximum(:order)
    self.order = last_order.to_i + 1
  end
end

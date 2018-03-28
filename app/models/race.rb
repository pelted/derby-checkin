class Race < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  validates :title, presence: true, length: { minimum: 8, maximum: 64 }
  validates :date, timeliness: { on_or_after: -> { Date.current }, type: :date }
  validates :time, timeliness: { between: '7:00am'...'10:00pm', type: :time }

  has_many :groups

  def slug_candidates
    [
      :title,
      %i[year title]
    ]
  end

  def year
    date.year || Date.today.year
  end
end

class Race < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  validates :title, length: { minimum: 8, maximum: 64 }
  validates :location, presence: true
  validates :date, timeliness: { on_or_after: -> { Date.current }, type: :date }
  validates :time, timeliness: { between: '7:00am'...'10:00pm', type: :time }

  before_save :update_location

  def slug_candidates
    [
      :title,
      %i[year title]
    ]
  end

  def date
    self[:date] || Date.today + 1.day
  end

  def time
    self[:time] || Time.zone.parse('10:00am')
  end

  def year
    date.year
  end

  def address
    self.location = { text: location } if location.is_a? String
    Address.new(location)
  end

  private

  def update_location
    self.location = if location.empty?
                      nil
                    else
                      JSON.parse location.gsub('=>', ':'), symbolize_names: false
                    end
  end
end

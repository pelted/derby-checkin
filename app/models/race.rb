# frozen_string_literal: true

class Race < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  validates :title, length: { minimum: 8, maximum: 64 }
  validates :location, presence: true
  validates :date, timeliness: { on_or_after: -> { Date.current }, type: :date, unless: -> { persisted? } }
  validates :time, timeliness: { between: '7:00am'...'10:00pm', type: :time }

  has_many :entries, dependent: :destroy

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
    loc = { text: location } if location.is_a? String
    Address.new(loc)
  end

  private

  def update_location
    self.location = JSON.parse location.gsub('=>', ':').to_json
  end
end

# frozen_string_literal: true

class Address
  include ActiveModel::Model

  attr_accessor(
    :text,
    :name,
    :formatted_address,
    :street_number,
    :route,
    :locality,
    :administrative_area_level_1,
    :country,
    :postal_code
  )

  def to_s
    text
  end
end

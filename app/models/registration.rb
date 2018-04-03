class Registration
  include ActiveModel::Model

  attr_accessor(
    :race,
    :racer,
    :entry,
    :first_name,
    :last_name,
    :unit,
    :rank,
    :car_name,
    :contact_name,
    :contact_email,
    :contact_phone
  )

  def save
    if valid?
      ActiveRecord::Base.transaction do
        @racer.save!
        @entry.save!
      end
    end
  end

  def valid?
    new_racer
    new_entry
    errors.empty?
  end

  private

  def new_racer
    @racer = Racer.new(
      first_name: first_name,
      last_name: last_name,
      unit: unit,
      rank: rank
    )
    unless racer.valid?
      promote_errors racer.errors
    end
  end

  def new_entry
    @entry = Entry.new(
      race: race,
      racer: racer,
      car_name: car_name,
      contact_name: contact_name,
      contact_email: contact_email,
      contact_phone: contact_phone
    )
    unless entry.valid?
      promote_errors entry.errors
    end
  end

  def promote_errors(child_errors)
    child_errors.each do |attribute, message|
      errors.add(attribute, message)
    end
  end
end
class UniqueEntryValidator < ActiveModel::Validator
  def validate(record)
    if Entry.find_by(race: record.race, racer: record.racer)
      record.errors.add(:racer, "is already entered in this race")
    else
      true
    end
  end
end
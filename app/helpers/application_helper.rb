# frozen_string_literal: true

module ApplicationHelper
  def field_error_messages(object, property)
    return unless object.errors.include? property
    errors = object.errors.full_messages_for(property)
    content_tag :div do
      errors.collect { |msg| concat content_tag :p, msg, class: ['help', 'is-danger'] }
    end
  end

  def field_error_class(object, property)
    'is-danger' if object.errors.include? property
  end
end

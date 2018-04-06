# frozen_string_literal: true

class RegistrationsController < ApplicationController
  before_action :set_race

  def new
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)
    @registration.race = @race

    if @registration.save
      redirect_to @race, notice: 'Entry was successfully created.'
    else
      render :new
    end
  end

  private

  def set_race
    @race = Race.friendly.find(params[:race_id])
  end

  def registration_params
    params.require(:registration).permit(
      :first_name,
      :last_name,
      :unit,
      :rank,
      :car_name,
      :contact_name,
      :contact_email,
      :contact_phone
    )
  end
end

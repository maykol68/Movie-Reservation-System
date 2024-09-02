# app/models/showtime.rb
class Showtime < ApplicationRecord
  has_many :reservations

  def available_seats
    # Devuelve una lista de asientos disponibles
  end
end

class ReservationsController < ApplicationController
  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.showtime.available_seats.include?(@reservation.seat_number)
      if @reservation.save
        redirect_to movies_path, notice: 'Reserva exitosa!'
      else
        render :new
      end
    else
      flash.now[:alert] = 'Asiento no disponible'
      render :new
    end
  end
end

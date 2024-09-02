class ReservationsController < ApplicationController
  def new
    @showtime = Showtime.find(params[:showtime_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save
      redirect_to movies_path, notice: 'Reserva exitosa!'
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:showtime_id, :seat_number)
  end
end

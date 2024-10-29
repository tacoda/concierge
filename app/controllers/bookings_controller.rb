class BookingsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create
    @room = Room.find(params[:room_id])
    @booking = @room.bookings.create(booking_params)
    redirect_to room_path(@room)
  end

  def destroy
    @room = Room.find(params[:room_id])
    @booking = @room.bookings.find(params[:id])
    @booking.destroy
    redirect_to room_path(@room), status: :see_other
  end

  private
    def booking_params
      params.require(:booking).permit(:guest, :start_date, :end_date)
    end
end

class BookingsController < ApplicationController
  # http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @room = Room.find(params[:booking][:room])
    @booking = @room.bookings.create(booking_params)

    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])

    if @booking.update(booking_params)
      redirect_to @booking
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:booking_id])
    @booking.destroy
    redirect_to booking_path(@booking), status: :see_other
  end

  private
    def booking_params
      params.require(:booking).permit(:guest, :start_date, :end_date)
    end
end

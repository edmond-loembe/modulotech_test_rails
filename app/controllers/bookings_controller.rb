class BookingsController < ApplicationController

  before_action :authenticate_user!, only: [:my_reservations]

  def new
    @room = Room.find(params[:room_id])
    @booking = Booking.new
  end

  def create
    @booking = current_user.bookings.new(booking_params)
    if @booking.save
      redirect_to root_path, notice: I18n.t('notices.booking_created')
    else
      render :new
    end
  end

  def my_reservations
    @reservations = current_user.bookings
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :room_id)
  end

end

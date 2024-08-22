class RoomsController < ApplicationController

  before_action :authenticate_user!

  def index
    @available_rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to my_rooms_path, notice: I18n.t('notices.room_created')
    else
      render :new
    end
  end

  def my_rooms
    @rooms = current_user.rooms
  end

  private

  def room_params
    params.require(:room).permit(:name, :description, :price_per_night, :capacity, images: [])
  end

end

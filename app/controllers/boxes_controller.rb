class BoxesController < ApplicationController
  before_action :set_box, only: %i[show edit]

  def index
    @boxes = Box.all
    @boxes = @boxes.select { |box| box.user_id == current_user.id }
  end

  def show
    return unless current_user.id != @box.user_id
  end

  def new
    @box = Box.new
    @receiver = Receiver.new
  end

  def create
    @box = Box.new(box_params)
    @box.user_id = current_user.id
    @box.location_id = params[:location]

    if @box.save
      # redirect to the index page
      redirect_to boxes_path
    else
      render 'new'
    end
  end

  def update
  end

  private

  def set_box
    @box = Box.find(params[:id])
  end

  def box_params
    params.require(:box)
          .permit(:message,
                  :is_public,
                  :user_id,
                  :receiver_name,
                  :storage_duration,
                  :start_date,
                  :price,
                  documents: [])
  end
end

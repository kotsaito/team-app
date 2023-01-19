class SchedulesController < ApplicationController
  def index
    @schedules = Schedule.order('start_time DESC')
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def schedule_params
    params.require(:schedule).permit(:title, :start_time, :place, :person, :practice, :others).merge(user_id: current_user.id)
  end
end

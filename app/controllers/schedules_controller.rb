class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  before_action :redirect_root, only: [:edit]

  def index
    @calendars = Schedule.order('start_time ASC')
    @schedules = Schedule.where("start_time > ?",Date.today).order('start_time ASC')
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
    @comment = Comment.new
    @comments = @schedule.comments.includes(:user)
  end

  def edit
  end

  
  def update
    if @schedule.update(schedule_params)
      redirect_to schedule_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @schedule.destroy && current_user.id == @schedule.user_id
  end


  private

  def schedule_params
    params.require(:schedule).permit(:title, :start_time, :place, :person, :practice, :others).merge(user_id: current_user.id)
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end
 
  def redirect_root
    redirect_to root_path unless current_user.id == @schedule.user_id 
  end

end

class WorksController < ApplicationController
  before_action :work_new, only:  [:index,:new]
  before_action :find_params, only: [:index, :create]
  def index
    @works = @group.works
  end

  def new
  end

  def create
    @work = @group.works.new(work_params)
    if @work.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def work_new
    @work = Work.new
  end
  def find_params
    @group = Group.find(params[:group_id])
  end
  def work_params
    params.require(:work).permit(:contents, :deadline, :work_name).merge(group_id: params[:group_id])
  end
end

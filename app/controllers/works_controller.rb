class WorksController < ApplicationController
  before_action :work_new, only:  [:index,:new]
  before_action :find_params, only: [:index, :create, :update]
  def index
    @works = @group.works.where.not(progress: 100).order(deadline: "ASC")
  end

  def new
  end

  def create
    @work = @group.works.new(work_params)
    if @work.save
      redirect_to group_works_path(@group)
    else
      render :new
    end
  end

  def destroy
    work = Work.find(params[:id])
    if work.destroy
      redirect_to root_path
    else
      render root_path
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    work = Work.find(params[:id])
    if work.update(work_params)
      redirect_to group_works_path(@group)
    else
      render :edit
    end
  end

  def show
    @work = Work.find(params[:id])
  end

  private

  def work_new
    @work = Work.new
  end
  def find_params
    @group = Group.find(params[:group_id])
  end
  def work_params
    params.require(:work).permit(:contents, :deadline, :work_name, :progress).merge(group_id: params[:group_id])
  end

end

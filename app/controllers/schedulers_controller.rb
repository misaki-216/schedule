class SchedulersController < ApplicationController
  def index
    @schedulers = Scheduler.all
    @total = Scheduler.all.count(:id)
  end

  def new
    @scheduler = Scheduler.new
  end

  def create
    @scheduler = Scheduler.new(params.require(:scheduler).permit(:title, :start, :end, :allday, :memo))
    if @scheduler.save
      flash[:notice]="スケジュールを新規登録しました"
      redirect_to :schedulers
    else
      render "new"
    end
  end

  def show
    @scheduler = Scheduler.find(params[:id])
  end

  def edit
    @scheduler = Scheduler.find(params[:id])
  end

  def update
    @scheduler = Scheduler.find(params[:id])
    if @scheduler.update(params.require(:scheduler).permit(:title, :start, :end, :allday, :memo))
      flash[:notice]="ユーザーが「#{@scheduler.id}」の情報を更新しました"
      redirect_to :schedulers
    else
      render "edit"
    end
  end

  def destroy
    @scheduler = Scheduler.find(params[:id])
    @scheduler.destroy
    flash[:notice]="スケジュールを削除しました"
    redirect_to :schedulers
  end

end

class ListsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @lists = List.where(user: current_user)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new permitted_params
    @list.user = current_user

    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:id])
  end

  private
  def permitted_params
    params.require(:list).permit(:name)
  end
end

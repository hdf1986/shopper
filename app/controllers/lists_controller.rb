class ListsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @lists = current_user.lists
    @shared_lists = current_user.shared_lists
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
    @list = current_user.lists.or(current_user.shared_lists).find(params[:id])
    @list_share = ListShare.new list: @list
  end

  private
  def permitted_params
    params.require(:list).permit(:name)
  end
end

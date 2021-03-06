class ListsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @lists = current_user.lists.not_archived
    @shared_lists = current_user.shared_lists.not_archived
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

  def destroy
    @list = List.find params.require(:id)

    @list.update archived_at: Time.zone.now

    redirect_to lists_path
  end

  def show
    @list = List.left_joins(:list_shares).where('list_shares.user_id = :user_id OR lists.user_id = :user_id', user_id: current_user.id).find(params[:id])
    @list_share = ListShare.new list: @list
  end

  private
  def permitted_params
    params.require(:list).permit(:name)
  end
end

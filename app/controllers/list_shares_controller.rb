class ListSharesController < ApplicationController
  def new
    @list = List.left_joins(:list_shares).where('list_shares.user_id = :user_id OR lists.user_id = :user_id', user_id: current_user.id).find(params[:list_id])
    @list_share = ListShare.new list: @list
  end

  def create
    @list = List.left_joins(:list_shares).where('list_shares.user_id = :user_id OR lists.user_id = :user_id', user_id: current_user.id).find(params[:list_id])
    
    @list_share = ListShare.new permitted_params
    @list_share.list = @list
    # TODO: Validate ownership of the list

    if @list_share.save
      # TODO: FLash message
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def permitted_params 
    params.require(:list_share).permit(:user_id)
  end
end

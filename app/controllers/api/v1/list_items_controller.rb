class Api::V1::ListItemsController < ApiController
  # TODO: Validate user
  
  def complete
    @list_item = ListItem.find(params[:list_item_id])
    @list_item.assign_attributes(permitted_params)
    @list_item.update_attributes(checked_at: Time.zone.now)
    
    redirect_to list_path(@list_item.list)
  end

  private
  def permitted_params
    params.require(:list_item).permit(:product_price, :final_amount)
  end
end

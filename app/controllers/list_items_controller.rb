class ListItemsController < ApplicationController
  # TODO: Validate users
  
  def create
    @list = List.find(params[:list_id])

    if found_product.valid? && list_item.save
      redirect_to list_path(@list)
    else
      binding.pry
      Rails.logger.info list_item.errors.details
      render 'lists/show'
    end
  end

  def destroy
    @list_item = ListItem.find(params[:id])
    @list_item.destroy

    redirect_to list_path(@list_item.list)
  end

  def complete
    @list_item = ListItem.find(params[:item_id])
    @list_item.update_attributes(checked_at: Time.zone.now)
    
    redirect_to list_path(@list_item.list)
  end

  private

  def list_item
    @list_item = ListItem.find_or_initialize_by list: @list, product: found_product, checked_at: nil do |li|
      li.amount = permitted_params[:amount].to_i
    end
    if @list_item.persisted?
      ListItem.update_counters @list_item.id, amount: permitted_params[:amount].to_i
      @list_item.reload 
    else
      @list_item
    end
  end

  def found_product
    @found_product if @found_product
    
    @found_product = Product.find_or_create_by(name: permitted_params[:product])
  end

  def permitted_params
    params.require(:list_item).permit(:product, :amount)
  end
end

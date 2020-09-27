class ProductsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @products = Product.visible_by_user(current_user).order(id: :desc)
  end
end

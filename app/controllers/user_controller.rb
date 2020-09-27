class UserController < ApplicationController
  before_action :authenticate_user!
  
  def configuration; end

  def update
    current_user.update(permitted_params)
    
    redirect_to configuration_user_index_path
  end

  private

  def permitted_params
    params.require(:user).permit(:suggestion_frequency)
  end
end

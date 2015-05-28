class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = @users.paginate page: params[:page], per_page: Settings.per_page
  end

  def update
    @user.update_attributes level: :admin
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t :delete_success
    else
      flash[:danger] = t :delete_fail
    end  
    redirect_to admin_users_path 
  end
end

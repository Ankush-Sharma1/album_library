class Admin::DashboardController < ApplicationController
  # before_action :authenticate_admin!

  def index
    @users = User.all.where(role: 'User')
  end

  def show
    @albums = Album.all.where(user_id: params[:id])
    # @photo = @album.photos.order(created_at: :desc)
  end

  def destroy_album
    # user_id = Album.find(params[:id]).id
    @album = Album.find(params[:dashboard_id])
    @album.destroy
    redirect_to admin_dashboard_index_path
  end

  def destroy
    @user=User.find(params[:id])
     if @user.destroy
      redirect_to admin_dashboard_index_path, notice: "User deleted."
    else
      redirect_to admin_dashboard_index_path, flash: {error: "User could not be deleted." }
    end
  end


  # def destroy_session
  #   debugger
  #   if role == :admin
  #   #   new_user_session_path
  #   # elsif role == :admin
  #   #   new_admin_session_path
  #   # else
  #   #   root_path

  #   end
  # end

end

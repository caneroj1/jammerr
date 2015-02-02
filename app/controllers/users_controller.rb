class UsersController < ApplicationController
  before_action :set_user_id_cookie

  def show
  end

  def search
  end

  def settings
  end

  def update
    current_user.update(prepare(params, current_user))
    respond_to do |format|
      format.html { redirect_to "show" }
      format.js { render layout: false }
    end
  end

  def async
    respond_to do |format|
      format.js { render "#{params[:page]}", layout: false }
    end
  end

  private
  def prepare(params, user)
    instruments = params[:user][:instruments]
    params[:user][:instruments] = instruments.split(' ')
    params[:user][:instruments] += (user.instruments)
    params[:user]
  end

  def set_user_id_cookie
    cookies[:uid] = current_user.id
  end
end

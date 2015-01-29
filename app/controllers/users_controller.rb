class UsersController < ApplicationController
  def show
  end

  def search
  end

  def settings
  end

  def async
    render "#{params[:page]}", layout: false
  end
end

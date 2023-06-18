class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def authenticate_user!
    unless user_signed_in?
      redirect_to login_path, flash: { error: 'You need to sign in or sign up before continuing.' }
    end
  end

  def user_signed_in?
    current_user.present?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
class ApplicationController < ActionController::Base

before_action :set_current_padder
before_action :authorized
  private

  def set_current_padder
    @current_padder = Padder.find_by(id: session[:padder_id])
  end

  def authorized
    redirect_to login_path unless @current_padder
  end
end

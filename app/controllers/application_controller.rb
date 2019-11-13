class ApplicationController < ActionController::Base

before_action :set_current_padder

  private

  def set_current_padder
    @current_padder = Padder.find_by(id: session[:padder_id])
  end
end

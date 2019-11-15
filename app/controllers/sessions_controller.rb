class SessionsController < ApplicationController
skip_before_action :authorized, only: [:new, :create]
    
    def new
    end

    def create
        padder = Padder.find_by(username: params[:session][:username])
    
        if padder && padder.authenticate(params[:session][:password])
    
        session[:padder_id] = padder.id
        redirect_to padder
        else
        flash[:notice] = "Login Incorrect!"
        redirect_to login_path
        end
    end

    def destroy
        session.delete(:padder_id)
        redirect_to login_path
    end
end

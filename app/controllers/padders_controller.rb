class PaddersController < ApplicationController
    before_action :set_padder, only: [:show, :edit, :update, :delete]
    def index
        @padders = Padder.all
    end

    def show
    end

    def new
        @padder = Padder.new
    end

    def create
    # byebug
        @padder = Padder.new(strong_params(:username, :password, :location_id))

        @padder.username.downcase!

        if  @padder.save
            flash[:notice] = "Account Created!"
            redirect_to @padder
         else
            flash[:notice] = "Username Taken Try again!"
            redirect_to signup_path
        end
    end

    def edit
        @errors = flash[:errors]
    end

    def update
        byebug

        params[:padder][:countries_visited] = params[:padder][:countries_visited].join(",")
        
        @padder.update(strong_params(:username, :password, :bio, :languages, :zodiac, :location_id, :countries_visited, :room_available))



        if @padder.save
            redirect_to @padder
        else
            flash[:errors]= @padder.errors.full_messages
            redirect_to edit_padder_path
        end
    end

    def delete
        @padder.destroy
        redirect_to padders_path
    end

    private

    def strong_params(*args)
        params.require(:padder).permit(*args)
    end

    def set_padder
        @padder = Padder.find(params[:id])
    end

end

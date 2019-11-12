class PaddersController < ApplicationController
    before_action :set_padder, only: [:show, :edit, :update, :delete]
    def index
        @padders = Padder.all
    end

    def show
    end

    def new
        @padder = Padder.new
        @errors = flash[:errors]
    end

    def create
        @padder= Padder.create(strong_params(:username, :password, :bio, :languages, :zodiac, :location_id, :countries_visited, :room_available))

        if @padder.valid?
            redirect_to @padder
        else
            flash[:errors]= @padder.errors.full_messages
            redirect_to new_padder_path
        end
    end

    def edit
        @errors = flash[:errors]
    end

    def update
        Padder.update(strong_params(:username, :password, :bio, :languages, :zodiac, :location_id, :countries_visited, :room_available))

        if @padder.valid?
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

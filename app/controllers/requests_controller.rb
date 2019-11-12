class RequestsController < ApplicationController

    def new
        @request = Request.new
        @errors = flash[:errors]
    end

    def create
        @request = Request.create(strong_params)

        if @request.valid?
            redirect_to request_path(@request.requester_padder_id)
        else
            flash[:errors]= @request.errors.full_messages
            redirect_to new_request_path
        end
    end

    def show
        @request = Request.find(params[:id])
    end

    private

    def strong_params
        params.require(:request).permit(:requestee_padder_id,:requester_padder_id )
    end
end

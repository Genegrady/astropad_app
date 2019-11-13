class RequestsController < ApplicationController
before_action :current_request, only:[:edit, :update, :delete, :request_accept, :request_decline]
    def new
        @request = Request.new
        @errors = flash[:errors]
    end

    def create
        byebug
        @request = Request.create(requestee_padder_id: params[:requestee_padder_id],requester_padder_id: params[:requestee_padder_id],dates: params[:dates], content: params[:content])

        redirect_to @current_padder
    end

    def show
        @request = Request.find(params[:id])
    end

    def edit
    end

    def accept
        # byebug
        # if params['button_action'] == 'accept'
        # 'accept' == true   
        # @request.update(request_status: params[:request_status]) 
        # redirect_to @current_padder
    end

    def decline
    #     @request.update(:request_status = false)
    #     flash[:notice] = "You declined this request!"
    #     redirect_to @current_padder
    end

    def delete
    end

    private

    def current_request
        @request = Request.find(params[:id])
    end

end

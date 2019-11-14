class RequestsController < ApplicationController
before_action :current_request, only:[:edit, :update, :delete, :accept, :decline]
    def new
        
        @request = Request.new
        @errors = flash[:errors]
    end

    def create
        @request =
       byebug
        Request.create(requestee_padder_id: params["/padders/#{params[:padder_id]}/requests/new"][:requestee_padder_id],requester_padder_id: params["/padders/#{params[:padder_id]}/requests/new"][:requester_padder_id],dates: params["/padders/#{params[:padder_id]}/requests/new"][:dates], content: params["/padders/#{params[:padder_id]}/requests/new"][:content])
        flash[:notice]= "You Accepted This Request"
        redirect_to @current_padder
    end

    def show
        @request = Request.find(params[:id])
    end

    def edit
    end

    def accept
        # byebug
       @request.update(request_status: true)
        
        redirect_to @current_padder
    end

    def decline
        
        # @request.update(request_status: params["/padders/:id/requests/:id"][:request_status])
        @request.update(request_status: true)
        flash[:notice] = "You declined this request!"

        redirect_to @current_padder
    end

    def destroy
        @request.destroy

        redirect_to @current_padder
    end

    private

    def current_request
        @request = 
        # byebug
        Request.find_by(params[padder_request_path(:padder_id)])
         
    end



end

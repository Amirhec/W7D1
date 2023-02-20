class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        session[:session_token] = @user.reset_session_token! 

        if @user.save
            login()
            redirect_to root_url

        else
            render :new
        end
    end
end

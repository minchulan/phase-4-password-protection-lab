class SessionsController < ApplicationController
    # Login - create a sessions controller with a create action for logging in that responds to a POST /login request
    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id 
            render json: user, status: :ok
        else  
            render json: "Invalid Credentials", status: :unauthorized 
        end 
    end 

    # Logout - create a sessions controller with a destroy action for logging out that responds to a DELETE /logout request
    def destroy
        session.delete(:user_id) 
    end 
end

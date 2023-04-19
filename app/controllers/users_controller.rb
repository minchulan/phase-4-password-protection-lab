class UsersController < ApplicationController
    def create 
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id #remembering who our user is 
            render json: user, status: :created  
        else  
            render json: {errors: "Invalid credentials"}, status: :unprocessable_entity
        end 
    end 

    # create a UsersController with a create method that responds to a POST /signup request. It should create a new user, save their hashed password in the database, save the user's ID in the session hash, and return the user object in the JSON response.
    # def create 
    #     user = User.create!(user_params)
    #     session[:user_id] = user.id 
    #     render json: user, status: :ok 
    # end 

    # add a show method to your UsersController that responds to a GET /me request. If the user is authenticated, return the user object in the JSON response.
    def show 
        # return the first user when the first user is logged in 
        # return the second user when the second user is logged in 
        user = User.find_by(id: session[:user_id])
        # return a 401 unauthorized response when no user is logged in 
        if user
            render json: user 
        else 
            render json: {error: "Not authorized"}, status: :unauthorized
        end 

    end 


    private
    def user_params
        params.permit(:username, :password)
    end 

end

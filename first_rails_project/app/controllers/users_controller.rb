class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users
    end

    def create
        user = User.new(user_params)
        # replace the `user_attributes_here` with the actual attribute keys
        user.save!
        render json: user
    end

    def show
        render json: params
    end

    def user_params
        params.require(:users).permit(:name, :email)
    end
end

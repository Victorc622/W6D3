class UsersController < ApplicationController
    def index

        if params[:username].present?
            @users = User.where("username LIKE ?", "%#{params[:username]}%")
        else
            @users = User.all
        end

        render json: @users
    end

    def create
        user = User.new(user_params)
        # replace the `user_attributes_here` with the actual attribute keys
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @user = User.find(params[:id])
        # @artworks_comments = User.liked_artworks_and_comments_for_user_id(params[:id])
        
        render json: @user
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_url(@user)
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        redirect_to users_url
    end

    private

    def user_params
        params.require(:users).permit(:username)
    end
end

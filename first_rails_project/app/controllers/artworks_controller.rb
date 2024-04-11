class ArtworksController < ApplicationController
    def index
        @user = User.find(params[:user_id])
        @artworks = Artwork.artworks_for_user_id(@user.id)
        render json: @artworks
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end

    def update
        @artwork = Artwork.find(params[:id])
        if @artwork.update(artwork_params)
            redirect_to artwork_url(@artwork)
        else
            render json: artwork.errors.full_messages, status: unprocessable_entity
        end
    end

    def destroy
        @artwork = Artwork.find(params[:id])
        @artwork.destroy

        redirect_to artworks_url
    end

    private

    def artwork_params
        params.require(:artworks).permit(:title, :image_url, :artist_id)
    end
end

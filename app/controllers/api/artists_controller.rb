class Api::ArtistsController < ApplicationController
    def index
      @artists = Artist.all
      render json: @artists
    #   render xml: @artists
    end
  
    def create
    #   @artist = Artist.create!(artist_params)
    #   redirect_to artist_path(@artist)
      @artist = Artist.new(artist_params)
      if @artist.save
        render json: @artist
      else
        render json: {
            message: 'Error when creating Artist'
        }
        end
    end
  
    def show
      @artist = Artist.find(params[:id])
      render json: @artist
    end
  
    def update
      @artist = Artist.find(params[:id])
      if @artist.update(artist_params)
        render json: @artist
      else 
        render json: {
            message: 'Error when updating Artist'
        }
    end

    #   redirect_to artist_path(@artist)
    end
  
    def destroy
      @artist = Artist.find(params[:id])
      @artist.destroyrender json: {
          message: 'Artist successfully destroyed'
      }
    #   redirect_to artists_path
    end
  
    private
  
    def artist_params
      params.require(:artist).permit(:name, :photo_url, :nationality)
    end
  end
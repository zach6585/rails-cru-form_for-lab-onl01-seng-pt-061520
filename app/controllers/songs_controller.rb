require 'pry'
class SongsController < ApplicationController
    def index
        @songs = Song.all 
    end 

    def show
        @song = Song.find_by_id(params[:id]) 
        @genre = Genre.find_by_id(@song.genre_id)
        @artist = Artist.find_by_id(@song.artist_id)
    end 

    def new 
        @song = Song.new 
    end 

    def create
        
        @song = Song.new(song_params)
        @song.name = params[:song][:name]
        @song.artist_id = params[:song][:artist_id]
        @song.genre_id = params[:song][:genre_id]
        @song.save 
        redirect_to song_path(@song)
    end
    
    def edit 
        @song = Song.find_by_id(params[:id])
        @artist = Artist.find_by_id(@song.artist_id)
        @genre = Genre.find_by_id(@song.genre_id)
    end 

    def update
        @song = Song.find_by_id(params[:id])
        @song.update(song_params)
        redirect_to song_path(@song)
    end


    private 

    def song_params
        params.require(:song).permit(:name, :artist_id, :genre_id)
    end 
end

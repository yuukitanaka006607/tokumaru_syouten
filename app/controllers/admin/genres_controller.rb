class Admin::GenresController < ApplicationController
   before_action :authenticate_admin!

   def new
     @genre = Genre.new
   end

   def create
     @genre = Genre.new(genre_params)
     @genre.save
     redirect_to admin_genres_path
   end

   def index
     @genres = Genre.all
   end

   def update
     @genre = Genre.find(params[:id])
     @genre.update(genre_params)
     redirect_to new_admin_genre_path
   end

   private

   def genre_params
      params.permit(:name)
   end
end

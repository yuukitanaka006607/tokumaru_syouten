class Public::HomesController < ApplicationController

  def top
    @genres = Genre.includes(:items)
    
    genre_id = params[:genre_id]
    
    if genre_id.present? #ジャンルIDが存在するとき
      genre = Genre.find(genre_id)
      @items = genre.items.page(params[:page])
    else #ジャンルIDが存在しない時
      @items = Item.page(params[:page])
    end
        
  end


end

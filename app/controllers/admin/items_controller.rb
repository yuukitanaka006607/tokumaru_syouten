class Admin::ItemsController < ApplicationController
   before_action :authenticate_admin!

   def new
     @item = Item.new
   end

   def  create
     @item =  Item.new(item_params)
     if @item.save
       redirect_to admin_item_path(@item.id)
     else
       render :new
     end
   end

   def show
     @item = Item.find(params[:id])
   end

   private

   def item_params
     params.require(:item).permit(:image, :name, :genre, :introduction, :price)
   end
end

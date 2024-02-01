class Admin::ItemsController < ApplicationController
   before_action :authenticate_admin!
   
   def new
     @item = Item.new
   end
   
   def  create
     @item =  Item.new(item_params)
     @item.save
     redirect_to root_path
   end
end

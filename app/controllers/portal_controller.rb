class PortalController < ApplicationController
  def show
    @categories = Category.all
    @recommended_items = Item.where(recommended: true)
  end  
end

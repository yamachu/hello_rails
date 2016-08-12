class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  # GET /items
  # GET /items.json
  def index
    @items = collection_root
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/recommended
  # GET /items/recommended.json
  def recommended
    @items = Item.where(recommended: true)
    render action: :index
  end

  def uncategorized
    @items = Item.where(category_id: nil)
    render action: :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    def collection_root
      params[:category_id] ? Category.find(params[:category_id]).items : Item.all
    end

end

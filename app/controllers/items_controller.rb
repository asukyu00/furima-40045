class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to '/'
  end

  private
  def item_params
    params.require(:item).permit(:user, :item_name, :item_description, :item_category_id, :item_condition_id,
    :burden_of_shipping_id, :prefecture_id, :delivery_time_id, :item_price, :image )
  end
end

class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :check_authorization, only: [:edit, :update]

  def index
    @items = Item.all
  end

  def show
    @item_sold_out = @item.sold_out?
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user

    if @item.save
      redirect_to root_path
    else
      flash.now[:error] = "保存に失敗しました。"
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      flash.now[:error] = "保存に失敗しました。"
      render :edit
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def check_authorization
    if @item.sold_out? || (@item.user != current_user)
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:image, :title, :description, :category_id, :condition_id, :shipping_fee_payer_id, :shipping_area_id, :shipping_day_id, :price)
  end
end

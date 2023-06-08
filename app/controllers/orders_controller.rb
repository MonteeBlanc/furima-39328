class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!
  
  def index
    if @item.blank? || (@item.sold_out? && @item.user != current_user)
      redirect_to root_path, alert: '商品が存在しません。'
    elsif @item.user == current_user
      redirect_to root_path, alert: '自身が出品した商品は購入できません。'
    else
      @order_form = PurchaseForm.new(user_id: current_user.id, item_id: @item.id)
    end
  end

  def create
    @order_form = PurchaseForm.new(order_params)
  
    if @order_form.valid?
      @order_form.save
      redirect_to root_path, notice: '決済が完了しました。'
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:purchase_form).permit(:postal_code, :shipping_area_id, :city, :street, :building, :phone_number).merge(token: params[:token])
  end

  def pay_item(token)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: token,
      currency: 'jpy'
    )
  end
  
end

class PurchaseRecordsController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!

  def index
    if @item.blank? || (@item.sold_out? && @item.user != current_user)
      redirect_to root_path, alert: '商品が存在しません。'
    elsif @item.user == current_user
      redirect_to root_path, alert: '自身が出品した商品は購入できません。'
    else
      @purchase_form = PurchaseForm.new(user_id: current_user.id, item_id: @item.id)
    end
  end

  def create
    @purchase_form = PurchaseForm.new(order_params)
    @purchase_form.user_id = current_user.id
    @purchase_form.item_id = @item.id
    
    if @purchase_form.valid?
      pay_item(@purchase_form.token)
      @purchase_form.save_with_related_records
      redirect_to root_path
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
  rescue Payjp::CardError => e
    puts "Payjp::CardError: #{e.message}"
    nil
  end
end

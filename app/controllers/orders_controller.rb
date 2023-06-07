class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!

  def index
    if @item.blank? || (@item.user == current_user && !@item.sold_out?)
      redirect_to root_path, alert: '商品が存在しません。'
    else
      @order_form = PurchaseForm.new(user_id: current_user.id, item_id: @item.id)
    end
  end

  def create
    @order_form = PurchaseForm.new(order_params)
    @order_form.user_id = current_user.id
    @order_form.item_id = @item.id
    if @order_form.valid?
      charge = pay_item(order_params[:token])
      if charge.present? && charge.paid
        @order_form.save_with_related_records
        redirect_to root_path, notice: '決済が完了しました。'
      else
        redirect_to root_path, alert: '決済に失敗しました。'
      end
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
    puts "Token in pay_item: #{token}"
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: token,
      currency: 'jpy'
    )
  end
  
end

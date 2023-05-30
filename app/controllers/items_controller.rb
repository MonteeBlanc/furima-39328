class ItemsController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
    @items = Item.all
  end

  def new
  end
  
  def create
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :name, :name_katakana, :surname, :surname_katakana, :date_of_birth])
  end
end


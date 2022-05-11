class ShippingAddressesController < ApplicationController
  before_action :set_user

  def index
    @shipping_addresses = @user.shipping_addresses
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
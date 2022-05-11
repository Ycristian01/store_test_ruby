class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = current_user.orders.build
  end

  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      redirect_to orders_path, notice: 'Order was successfully created.'
    else
      render :new
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:number, :shipping_address_id, :payment_type)
  end
end
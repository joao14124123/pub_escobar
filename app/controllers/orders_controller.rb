class OrdersController < ApplicationController
  def create
    order = Order.new(order_params)
    if order.save
      render json: order, status: :created
    else
      render json: order.errors, status: :unprocessable_entity
    end
  end

  def index
    orders = Order.all
    render json: orders
  end

  def show
    order = Order.find(params[:id])
    render json: order, include: { order_items: { include: :item } }
  end

  def destroy
    order = Order.find(params[:id])
    if order.destroy
      head :no_content
    else
      render json: order.errors, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_name, :total, order_items_attributes: [:quantity, :item_id])
  end
end

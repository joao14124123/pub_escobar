class OrderItemsController < ApplicationController
  def index
    order = Order.find(params[:order_id])
    order_items = order.order_items.includes(:item)
    render json: order_items, include: :item
  end

  def create
    order_item = OrderItem.new(order_item_params)
    if order_item.save
      render json: order_item, status: :created
    else
      render json: order_item.errors, status: :unprocessable_entity
    end
  end

  def update
    order_item = OrderItem.find(params[:id])
    if order_item.update(order_item_params)
      render json: order_item
    else
      render json: order_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    order_item = OrderItem.find(params[:id])
    if order_item.destroy
      head :no_content
    else
      render json: order_item.errors, status: :unprocessable_entity
    end
  end


  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :item_id, :order_id)
  end
end

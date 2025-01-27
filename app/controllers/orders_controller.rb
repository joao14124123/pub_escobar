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
    order = Order.all
    render json: order
  end

  def show
    order = Order.find(params[:id])
    render json: order
  end

  def update
    order = Order.find(params[:id])
    if order.update(order_params)
      render json: order
    else
      render json: order.errors, status: :unprocessable_entity
    end
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
    params.require(:order).permit(:customer_name)
  end
end

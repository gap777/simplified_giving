class GiftExchangesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @gift_exchanges = current_user.managed_gift_exchanges
  end

  def show
    @gift_exchange = GiftExchange.find(params[:id])
  end

  def new
    @gift_exchange = GiftExchange.new
  end

  def create
    @gift_exchange = GiftExchange.new(**gift_exchange_params, owner: current_user)
    if @gift_exchange.save
      redirect_to gift_exchanges_path, notice: 'Gift exchange was successfully created.'
    else
      render :new
    end
  end

  def edit
    unless current_user.managed_gift_exchanges.exists?(params[:id])
      redirect_to gift_exchanges_path, notice: 'You are not authorized.'
      return
    end

    @gift_exchange = GiftExchange.find(params[:id])
  end

  def update
    @gift_exchange = GiftExchange.find(params[:id])
    if @gift_exchange.update(gift_exchange_params)
      redirect_to gift_exchanges_path, notice: 'Gift exchange was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @gift_exchange = GiftExchange.find(params[:id])
    @gift_exchange.destroy
    redirect_to gift_exchanges_path
  end

  private

  def gift_exchange_params
    params.require(:gift_exchange).permit(:name, :description, :event_date)
  end
end

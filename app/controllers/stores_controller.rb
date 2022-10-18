class StoresController < ApplicationController
  def index
    @stores = Store.is_open
  end

  def show
    @store = Store.find(params[:id])
  end

  def edit
    @store = Store.find(params[:id])

  end

  def update
    store = Store.find(params[:id])
    store.update(store_params)
    redirect_to "/stores/#{store.id}"
  end

  private
  def store_params
    params.permit(:name, :open, :sold_per_month)
  end

end
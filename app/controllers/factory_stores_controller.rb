class FactoryStoresController < ApplicationController
  def index
    @factory = Factory.find(params[:factory_id])
    @stores = @factory.stores.all
  end

  def new
    @factory = Factory.find(params[:id])
  end

  def create 
    @factory = Factory.find(params[:id])
    store = Store.create({
      name: params[:name],
      open: params[:open],
      sold_per_month: params[:sold_per_month],
      factory_id: @factory.id
      })
    redirect_to "/factories/#{@factory.id}/stores"
  end
end
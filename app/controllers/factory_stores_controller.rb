class FactoryStoresController < ApplicationController
  def index
    @factory = Factory.find(params[:factory_id])
    # binding.pry
    @stores = @factory.stores.all
  end
end
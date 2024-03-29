class FactoriesController < ApplicationController
  def index
    @factories = Factory.all
  end

  def show
    @factory = Factory.find(params[:id])
  end

  def new
  end

  def edit
    # require 'pry'; binding.pry
    @factory = Factory.find(params[:id])
    # @name = @factory.name
  end

  def create
    factory = Factory.create(factory_params)
    redirect_to "/factories"
  end

  def update
    factory = Factory.find(params[:id])
    factory.update(factory_params)
    redirect_to "/factories/#{factory.id}"
  end
  
  private
  def factory_params
    params.permit(:name, :operational, :rank)
  end
end
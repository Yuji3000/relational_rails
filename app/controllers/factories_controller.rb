class FactoriesController < ApplicationController
  def index
    @factories = Factory.all
    #.order_created_at
  end

  def show
    @factory = Factory.find(params[:id])
  end

  def new

  end

  def edit
    @factory = Factory.find(params[:id])

   
  end

  def create
    factory = Factory.create({
      name: params[:name],
      operational: params[:operational],
      rank: params[:rank]
      })
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
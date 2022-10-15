class FactoriesController < ApplicationController
  def index
    @factories = Factory.all.order_created_at
  end

  def show
    @factory = Factory.find(params[:id])
  end
end
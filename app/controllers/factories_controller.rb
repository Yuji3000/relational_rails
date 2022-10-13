class FactoriesController < ApplicationController
  def index
    @factories = Factory.all
  end
end
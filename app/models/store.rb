class Store < ApplicationRecord
  belongs_to :factory

  def self.is_open
    Store.where("open = true")
  end
end
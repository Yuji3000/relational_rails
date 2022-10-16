class Factory < ApplicationRecord
  has_many :stores

  def self.order_created_at
    self.order(created_at: :desc)
  end

end
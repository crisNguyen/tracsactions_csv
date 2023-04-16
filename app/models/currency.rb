class Currency < ApplicationRecord
  has_many :transactions

  validates :name, :currency, presence: true, uniqueness: true
end
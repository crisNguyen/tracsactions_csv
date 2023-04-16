class Token < ApplicationRecord
  has_many :transactions

  validates :name, :symbol, :coin_name, :full_name, presence: true
  validates :name, :symbol, uniqueness: true
end
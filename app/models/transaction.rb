class Transaction < ApplicationRecord
  belongs_to :currency
  belongs_to :token

  enum :transaction_type, { DEPOSIT: 0, WITHDRAWAL: 1 }
  delegate :symbol, to: :token

  validates :transaction_type, :amount, presence: true

  CSV_ATTRIBUTES = %w(created_at transaction_type token amount portfolio).freeze
end
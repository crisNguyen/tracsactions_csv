class TransactionsService
  def initialize(token_symbol = nil, date = nil)
    @date = date
    @token = Token.find_by(symbol: token_symbol)
  end

  def perform
    case
    when (token && date).present?
      transaction_includes_token.where('DATE(transactions.created_at) = ?', date.to_date).where(token_id: token.id)
    when token.present? && date.nil?
      transaction_includes_token.where(token_id: token.id).limit(1)
    when date.present? && token.nil?
      transaction_includes_token.where('DATE(transactions.created_at) = ?', date.to_date)
    else
      transaction_includes_token.order(created_at: :desc).uniq(&:token_id)
    end
  end

  private

  attr_reader :date, :token

  def transaction_includes_token
    Transaction.includes(:token).references(:token)
  end
end
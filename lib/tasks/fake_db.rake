namespace :fake_db do
  desc "Create token from cryptocopare"
  task create_token: :environment do
    coin_list = CryptoCompareService.coin_list
    Token.create!(coin_list)
  end

  desc "Create Transaction"
  task create_transaction: :environment do
    (0..100).each do |time|
      token = Token.find(rand(1..1000))
      Transaction.create!(token_id: token.id, amount: rand(1..10), currency_id: 1, transaction_type: rand(0..1))
    end
  end

  desc "Update Portfolio Transaction"
  task update_portfolio_transaction: :environment do
    Transaction.transaction do
      Transaction.includes(:token, :currency).each do |t|
        token = t.token.symbol
        currency = t.currency.currency
        portfolio_from_crypto = CryptoCompareService.price_token_to_time(token, currency, t.created_at.to_i)
        portfolio_from_crypto = portfolio_from_crypto[token].present? ? portfolio_from_crypto[token][currency] : 0.0
        t.update!(portfolio: portfolio_from_crypto * t.amount)
      end
    end
  end
end

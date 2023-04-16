require 'cryptocompare'
class CryptoCompareService
  def self.coin_list
    rs = []
    Cryptocompare::CoinList.all['Data'].each do |_, v|
      rs << { name: v['Name'], symbol: v['Symbol'],
              coin_name: v['CoinName'], full_name: v['FullName'] }
    end
    rs
  end

  def self.price_token_to_time(token_name, currency, time)
    Cryptocompare::Price.find(token_name, currency, { 'ts' => time })
  end
end

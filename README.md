# Setting project
ruby 3.0.0
Rails 7.0.4.3
Postgresql 12.14

# Database
3 table:
transactions: save data transactions (has portfolio column to save balance of the token where you need to add deposits and subtract withdrawals this time)
tokens: save token info
currencies: save info currency

# flow
I create task to create tokens from https://www.cryptocompare.com/(rake fake_db:create_token)
I create task to create transactions and update portfolio by time from https://www.cryptocompare.com/(rake fake_db:create_transaction - fake_db:update_portfolio_transaction)
Portfolio = amount * price of token this time(get from https://www.cryptocompare)
I create csv file flow to requirement
I create concurrency data by my hand
http://localhost:3000/export_transactions(params: symbol, date) example(http://localhost:3000/export_transactions?symbol=42&date=11/4/2022)


class Stock < ApplicationRecord
    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
            secret_token: Rails.application.credentials.iex_client[:secret_api_key],
            endpoint: 'https://sandbox.iexapis.com/v1'
          ) 
        new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price: client.quote(ticker_symbol).latest_price)
    end
end

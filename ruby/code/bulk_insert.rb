gem 'activerecord-import'
--------------------------------
all_exchanges = []
all_exchanges << AllExchange.new(
  exchange_name:    "Binance",
  bid_price_yen:    binance_bid_price_yen,
  ask_price_yen:    binance_ask_price_yen,
  dollar_price:     dollar,
  bid_price_dollar: binance_hash["bidPrice"],
  ask_price_dollar: binance_hash["askPrice"],
  pair:             "BTC/USDT"
)
all_exchanges << AllExchange.new(
  exchange_name:    "Liquid",
  bid_price_yen:    liquid_hash["market_bid"],
  ask_price_yen:    liquid_hash["market_ask"],
  dollar_price:     dollar,
  bid_price_dollar: liquid_bid_price_dollar,
  ask_price_dollar: liquid_ask_price_dollar,
  pair:             "BTC/JPY"
)
all_exchanges << AllExchange.new(
  exchange_name:    "BitMEX",
  bid_price_yen:    bitmex_bid_price_yen,
  ask_price_yen:    bitmex_ask_price_yen,
  dollar_price:     dollar,
  bid_price_dollar: bitmex_hash[0]["bidPrice"], 
  sk_price_dollar:  bitmex_hash[0]["askPrice"],
  pair:             "BTC/USD"
)
all_exchanges << AllExchange.new(
  exchange_name:    "Bitfinex",
  bid_price_yen:    bitfinex_bid_price_yen,
  ask_price_yen:    bitfinex_ask_price_yen,
  dollar_price:     dollar,
  bid_price_dollar: bitfinex_hash[0][1],
  ask_price_dollar: bitfinex_hash[0][3],
  pair:             "BTC/USD"
)
AllExchange.import all_exchanges
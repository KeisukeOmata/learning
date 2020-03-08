require 'net/http'
require 'uri'
require 'json'
def api
  api = Net::HTTP.get(URI.parse('https://hoge'))
  hash = JSON.parse(api)
  # ハッシュの取り出し方は適宜
  hoge = Hoge.new(hoge: hash["hoge"])
  hoge.save
end
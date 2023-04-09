require 'json'
require 'net/http'

APP_ID = ENV['YAHOO_APP_ID']
URL = URI('https://jlp.yahooapis.jp/MAService/V2/parse')

class KeywordExtractor
    def post(query)
        headers = {
            "Content-Type": "application/json",
            "User-Agent": "Yahoo AppID: #{APP_ID}"
        }

        param_dic = {
            "id": "1234-1",
            "jsonrpc": "2.0",
            "method": "jlp.maservice.parse",
            "params": {
                "q": query,
            }
        }

        params = param_dic.to_json
        res = Net::HTTP.post(URL, params, headers)
        body = res.body
        body.force_encoding('UTF-8')
    end

    def extract_keywords_from_response(res)
        json = JSON.parse(res)
        list = []
        json["result"]["tokens"].each do |token|
            if token.include?("名詞") || token.include?("形容詞") || token.include?("未定義語")
                list << token[0]
            end
        end
        list
    end
end

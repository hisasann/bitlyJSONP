require "json"
require "net/http"

class BitlyController < ApplicationController
  def convert
    bitlyUrl = shorten(params[:url])

    @data = {
      "url" => bitlyUrl,
      "callback" => params[:callback]
    }
  end
  
  private
  
  def shorten(long_url)
    id = 'hisasann'
    api_key = 'R_8fd7c8e2ccde5c7a3068e2e6f9f6036d'

    query = "longUrl=#{long_url}&login=#{id}&apiKey=#{api_key}&format=json"
    result = JSON.parse(Net::HTTP.get("api.bit.ly", "/v3/shorten?#{query}"))
    return result["data"]["url"]
  end
end

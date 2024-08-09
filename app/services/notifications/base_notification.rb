#frozen_string_literal: true

class Notifications::BaseNotification
  def initialize(method:, headers:, url:, payload:)
    @method = method
    @headers = headers
    @url = url
    @payload = payload
  end

  def send
    if @method == 'post'
      post(@url, @headers, @payload)
    elsif @method == 'get'
      get(@url, @headers, @payload)
    end
  end

  private

  def post(url, headers, payload)
    HTTParty.post(url, headers: headers, body: payload)
  end

  def get(url, headers, payload)
    HTTParty.get(url, headers: headers, body: payload)
  end
end
class IrkitController < ApplicationController
  def index
    unless deviceid && clientkey
      render text: "Please set IRKIT_DEVICEID and IRKIT_CLIENTKEY"
      return
    end

    @keys = ENV.keys.map do |key|
      if /^IRKIT_MESSAGE_(.+)$/ =~ key
        $1
      end
    end.compact
  end

  def post
    key = params[:key]

    conn = Faraday.new(:url => 'https://api.getirkit.com') do |faraday|
      faraday.request :url_encoded
      faraday.response :logger
      faraday.adapter Faraday.default_adapter
    end

    conn.post '/1/messages', {
      'clientkey' => clientkey,
      'deviceid' => deviceid,
      'message' => ENV["IRKIT_MESSAGE_#{key}"],
    }
  end

  private

  def deviceid
    ENV['IRKIT_DEVICEID']
  end

  def clientkey
    ENV['IRKIT_CLIENTKEY']
  end
end

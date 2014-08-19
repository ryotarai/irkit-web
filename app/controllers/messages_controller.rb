class MessagesController < ApplicationController
  def index
    @keys = ENV.keys.map do |key|
      if /^IRKIT_MESSAGE_(.+)$/ =~ key
        $1
      end
    end.compact.sort
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
end

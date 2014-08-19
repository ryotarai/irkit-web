class IrkitController < ApplicationController
  def index
    unless deviceid && clientkey
      render text: "Please set IRKIT_DEVICEID and IRKIT_CLIENTKEY"
      return
    end
  end

  private

  def deviceid
    ENV['IRKIT_DEVICEID']
  end

  def clientkey
    ENV['IRKIT_CLIENTKEY']
  end
end

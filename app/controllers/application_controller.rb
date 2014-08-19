class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  http_basic_authenticate_with name: ENV['BASIC_USERNAME'], password: ENV['BASIC_PASSWORD']

  before_action :check_variables

  def check_variables
    %w! IRKIT_DEVICEID IRKIT_CLIENTKEY BASIC_USERNAME BASIC_PASSWORD !.each do |key|
      unless ENV[key]
        render text: "Please set #{key}"
        return
      end
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

class ApplicationController < ActionController::Base
  def root
    sleep ENV['CUPRITE_TIMEOUT'].to_i + 1
  end
end

class ApplicationController < ActionController::Base
  include SessionsHelper

  def hello
    render html: 'Welcome to private events'
  end
end

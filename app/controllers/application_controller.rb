class ApplicationController < ActionController::Base

  protected

  def not_authenticated
    redirect_to root_url
  end
end

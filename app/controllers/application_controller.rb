class ApplicationController < ActionController::Base
    include Pundit

    add_flash_types :success, :danger

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  private
  def user_not_authorized
    flash[:danger] = "You are not authorized to perform this action"
    redirect_to(request.referrer || root_path)
  end
end

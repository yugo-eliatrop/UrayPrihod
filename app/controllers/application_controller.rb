class ApplicationController < ActionController::Base
  before_action :set_global_contact

  protect_from_forgery prepend: true

  private

  def set_global_contact
    @contact = Contact.first
  end

  def check_rights
    redirect_to root_path unless current_user.admin
  end
end

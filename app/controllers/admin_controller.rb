class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_rights

  def index; end

  def edit_sm_about
    @text = Text.where(title: 'About').first
  end

  def update_sm_about
    @text = Text.where(title: 'About').first
    if @text.update(params.require(:text).permit(:content))
      redirect_to admin_path
    else
      render :edit_sm_about
    end
  end

  def edit_history
    @text = Text.where(title: 'History').first
  end

  def update_history
    @text = Text.where(title: 'History').first
    if @text.update(params.require(:text).permit(:content))
      redirect_to admin_path
    else
      render :edit_history
    end
  end

  def edit_holiday
    @text = Text.where(title: 'Holiday').first
  end

  def update_holiday
    @text = Text.where(title: 'Holiday').first
    if @text.update(params.require(:text).permit(:content))
      redirect_to admin_path
    else
      render :edit_holiday
    end
  end
end

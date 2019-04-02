class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_rights

  def index; end

  def edit_sm_about
    @text = Text.find_by(title: 'About')
  end

  def update_sm_about
    @text = Text.find_by(title: 'About')
    if @text.update(params.require(:text).permit(:content))
      redirect_to admin_path
    else
      render :edit_sm_about
    end
  end

  def edit_history
    @text = Text.find_by(title: 'History')
  end

  def update_history
    @text = Text.find_by(title: 'History')
    if @text.update(params.require(:text).permit(:content))
      redirect_to admin_path
    else
      render :edit_history
    end
  end

  def edit_holiday
    @text = Text.find_by(title: 'Holiday')
  end

  def update_holiday
    @text = Text.find_by(title: 'Holiday')
    if @text.update(params.require(:text).permit(:content))
      redirect_to admin_path
    else
      render :edit_holiday
    end
  end

  def edit_priests
    @text = Text.find_by(title: 'Priests')
  end

  def update_priests
    @text = Text.find_by(title: 'Priests')
    if @text.update(params.require(:text).permit(:content))
      redirect_to admin_path
    else
      render :edit_priests
    end
  end

  def edit_schedule
    @text = Text.find_by(title: 'Schedule')
  end

  def update_schedule
    @text = Text.find_by(title: 'Schedule')
    if @text.update(params.require(:text).permit(:content))
      redirect_to admin_path
    else
      render :edit_schedule
    end
  end

  def edit_announcement
    @text = Text.find_by(title: 'Announcement')
  end

  def update_announcement
    @text = Text.find_by(title: 'Announcement')
    if @text.update(params.require(:text).permit(:content))
      redirect_to admin_path
    else
      render :edit_announcement
    end
  end
end

require 'zip'

class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :check_rights

  def index
    @user = current_user
  end

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

  def update_name
    user = current_user
    if user.update(name: params[:user][:name])
      redirect_to admin_path
    else
      redirect_to edit_user_registration_path
    end
  end

  def download_notes
    zip_path = 'notes/notes.zip'
    File.delete(zip_path) if File.exist?(zip_path)
    zip_file = File.new(zip_path, 'w')
    Zip::File.open(zip_file.path, Zip::File::CREATE) do |zip|
      zip.add('О здравии', 'notes/alive.txt')
      zip.add('О упокоении', 'notes/dead.txt')
      zip.add('Врачу душ и телес', 'notes/to_doctor.txt')
    end
    send_file zip_file
  end

  def clear_notes
    %w[alive dead to_doctor].each do |name|
      File.open("notes/#{name}.txt", 'w') { |file| file.truncate(0) }
    end
    redirect_to admin_path
  end
end

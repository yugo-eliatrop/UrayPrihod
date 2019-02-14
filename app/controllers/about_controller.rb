class AboutController < ApplicationController
  def index
    @text = Text.where(title: 'About').first
  end

  def holiday
    @text = Text.where(title: 'Holiday').first
  end

  def history
    @text = Text.where(title: 'History').first
  end
end

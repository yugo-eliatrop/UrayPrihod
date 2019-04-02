class WelcomeController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC').limit!(2)
    @text = Text.find_by(title: 'About')
    @announcement = Text.find_by(title: 'Announcement')
  end
end

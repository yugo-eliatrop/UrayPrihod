class WelcomeController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC').limit!(2)
    @text = Text.where(title: 'About').first
  end
end

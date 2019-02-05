class WelcomeController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC').limit!(2)
  end
end

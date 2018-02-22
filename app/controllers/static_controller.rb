class StaticController < ApplicationController
  def homepage
    @blogs = Blog.all 
  end
end
class BlogsController < ApplicationController
  
  before_action :move_to_index, except: [:index]
  
  def index
    @blogs = Blog.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
     @blog = Blog.create(title: blog_params[:title], text: blog_params[:text], user_id: current_user.id)
     if @blog.save
      redirect_to root_path
    else 
      render :new
    end
  
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params) if blog.user_id == current_user.id
    redirect_to action: :index
  end

  def destroy
      blog = Blog.find(params[:id])
      if blog.user_id == current_user.id
        blog.destroy
      end
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :text)
  end

  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end

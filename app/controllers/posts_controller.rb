class PostsController < ApplicationController
	before_action :find_post, only: [:show, :update, :edit]
	
	def index
		@posts = Post.all
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(create_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
	end

	def update
	  @post.update(update_params)
	  redirect_to post_path(@post)
	end

	def edit
	end

	private 

	def find_post
		@post = Post.find(params[:id])
	end 

	def update_params 
		params.require(:post).permit(:title, :description, :post_status, :author_id)
	end 

	def create_params 
		params.require(:post).permit(:title, :description)
	end 
end

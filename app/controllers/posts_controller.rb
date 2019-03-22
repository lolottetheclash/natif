class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :check_admin, only: [:new, :create, :update, :edit, :destroy]

  def index
    @posts = Post.page(params[:page])
  end

  def postDashboard
    @posts = Post.all
  end

  def show
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_post
     Post.find(params[:id])
    end

    def post_params
      params.fetch(:post, {})
    end
    def check_admin
      if RoleAssignation.find_by_user_id(current_user.id).role_id == 3 or RoleAssignation.find_by_user_id(current_user.id).role_id == 8
      else
        respond_to do |format|
          format.html { redirect_to request.referer }
          format.json { head :no_content }
        end
      end
    end
end

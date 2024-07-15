class Public::GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def index
    @post = Post.new
    @groups = Group.all
    @user = User.find(current_user.id)
  end

  def show
    @group = Group.find(params[:id])
    @posts = @group.posts
    @new_post = Post.new
  end

  def new
    @group = Group.new
    @posts = Post.all
  end

  
  def create
    group_params
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @posts = Post.all
    if @group.save
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path
    else
      render "edit"
    end
  end
  
  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, post_ids: [])
  end

  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to groups_path
    end
  end
end
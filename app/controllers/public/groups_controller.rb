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
    @post = Post.find(params[:post_id])
    @new_post = Post.new
  end

  def new
    @group = Group.new
    @posts = Post.all
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    @group.post_ids = params[:group][:post_ids]
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

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :group_image)
    params[:group][:post_ids] = params[:group][:post_ids].select { |id| id.to_i != 0 }
    params.require(:group).permit(post_ids: [])
  end

  def ensure_correct_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to groups_path
    end
  end
end
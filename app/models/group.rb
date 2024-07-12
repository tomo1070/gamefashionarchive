class Group < ApplicationRecord
  has_many :group_index, dependent: :destroy
  belongs_to :owner, class_name: 'User'
  has_many :post, through: :group_post

  validates :name, presence: true
  validates :introduction, presence: true
  
  def is_owned_by?(user)
    owner.id == post.id
  end
end

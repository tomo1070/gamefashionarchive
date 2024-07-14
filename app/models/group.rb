class Group < ApplicationRecord
  has_many :group_posts, dependent: :destroy
  belongs_to :owner, class_name: 'User'
  has_many :posts, through: :group_posts

  validates :name, presence: true
  validates :introduction, presence: true
  
  def is_owned_by?(user)
    owner.id == user.id
  end
end
class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :posts, through: :group_posts
  enum tag: { tank: 0, melee_dps: 1, long_dps: 2, healer:3 }

  attribute :title, :string

  validates :title, presence: true
  validates :comment, presence: true
  validates :image, presence: true
  
  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end
  def guest_user?
    email == GUEST_USER_EMAIL
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts
  has_many :comments
  has_many :likes

  # Name must not be blank.
  validates :name, presence: true

  # PostsCounter must be an integer greater than or equal to zero.
  # validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_post(id)
    Post.order(created_at: :desc).where(author_id: id).first(3)
  end
end

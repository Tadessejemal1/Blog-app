class User < ApplicationRecord
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  # Name must not be blank.
  validates :name, :photo, :bio, presence: true

  # PostsCounter must be an integer greater than or equal to zero.
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def recent_post(id)
    Post.where(user_id: id).order(created_at: :desc).limit(3)
  end
end
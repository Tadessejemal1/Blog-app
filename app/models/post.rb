class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', counter_cache: :posts_counter
  has_many :comments
  has_many :likes
  after_save :update_posts_counter

  # Title must not be blank
  validates :title, presence: true, allow_blank: false
  # Title must not exceed 250 characters.
  validates :title, length: { minimum: 1, maximum: 250 }

  # CommentsCounter must be an integer greater than or equal to zero
  # LikesCounter must be an integer greater than or equal to zero.
  # validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # private

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def last_five_comments
    comments.order(created_at: :desc).limit(5)
  end
end

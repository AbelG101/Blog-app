class Post < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_many :likes, class_name: "Like", foreign_key: "post_id"
  has_many :comments, class_name: "Comment", foreign_key: "post_id"

  def update_posts_count
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.limit(5).order(created_at: :asc)
  end
  
end
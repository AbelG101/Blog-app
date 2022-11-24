require 'rails_helper'

describe Post, type: :model do
  before :each do
    @author = User.new(name: 'Abel', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Life goes on.')
    @post = Post.new(author: @author, title: 'My 1st blog', text: 'This is my first blog post')
  end

  it 'should be invalid for a blank title' do
    @post.title = nil
    expect(@post).to_not be_valid
  end

  it 'should be invlaid for a negative comments counter' do
    @post.comments_counter = -1
    expect(@post).to_not be_valid
  end

  it 'should be invlaid for a negative posts counter' do
    @post.likes_counter = -1
    expect(@post).to_not be_valid
  end

  describe '#update_posts_count' do
    it 'should increment amount of posts by 1' do
      @post.update_posts_count
      expect(@author.posts_counter).to eq(1)
    end
  end

  describe '#recent_comments' do
    it 'should return the last 5 comments of the given author ' do
      6.times { |num| Comment.create(post: @post, author: @author, text: "comment, No:#{num + 1}!") }

      expect(@post.recent_comments.length).to eq(5)
      expect(@post.recent_comments[-1].text).to eq('comment, No:5!')
    end
  end
end

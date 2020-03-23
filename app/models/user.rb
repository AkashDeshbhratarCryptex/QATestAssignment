class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable
  has_many :questions
  has_many :answers
  has_many :topics
  has_many :follows

  def followers
    followers_ids = Follow.where(following_id: self.id).where(following_type: 'User').pluck(:user_id).uniq
    self.class.where(id: followers_ids)
  end

  def followings
    self.follows.where(following_type: 'User')
  end

  def topic_followers
    followers_ids = Follow.where(following_id: self.id).where(following_type: 'Topic').pluck(:user_id).uniq
    self.class.where(id: followers_ids)    
  end

  def topic_followings
    self.follows.where(following_type: 'Topic')    
  end
end

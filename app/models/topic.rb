class Topic < ApplicationRecord
  belongs_to :user
  validates :title, uniqueness: true
  validates :title, presence: true
  validates :description, presence: true    
end

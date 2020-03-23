class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  validates :description, presence: true    
end

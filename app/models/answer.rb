class Answer < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :question
  #validates :body, presence: true

  validates :body, presence: {message: " should be present"}
end

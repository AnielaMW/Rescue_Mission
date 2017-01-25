class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :answer

  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :description, presence: true, length: { minimum: 50 }
end

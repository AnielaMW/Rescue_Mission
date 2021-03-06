class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 40 }
  validates :description, presence: true, length: { minimum: 150 }
end

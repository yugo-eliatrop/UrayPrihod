class Question < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  belongs_to :answerer, class_name: :user, foreign_key: :user_id,
                        optional: true

  scope :answered, -> { where.not(answer_text: nil) }
  scope :unanswered, -> { where(answer_text: nil) }
end

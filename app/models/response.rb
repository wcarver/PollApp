class Response < ActiveRecord::Base
  validates :user_id, :answer_id, presence: true

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_id,
    class_name: 'Answer'
end

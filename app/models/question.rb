class Question < ActiveRecord::Base
  validates :question_text, :poll_id, presence: true
  
  has_many :answer_choices,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: 'Answer'

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: 'Poll'
end

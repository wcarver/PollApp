class Answer < ActiveRecord::Base
  validates :question_id, :body, presence: true
  
  belongs_to :question,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: 'Question'

  has_many :responses,
    primary_key: :id,
    foreign_key: :answer_id,
    class_name: 'Responses'
end

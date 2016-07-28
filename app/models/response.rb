class Response < ActiveRecord::Base
  validates :user_id, :answer_id, presence: true
  validate :respondent_already_answered?, :author_answering_question?

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_id,
    class_name: 'Answer'

  has_one :question,
    through: :answer_choice,
    source: :question


    def sibling_responses
      self.question.responses.where.not(id: self.id)
    end

    def respondent_already_answered?
      if self.sibling_responses.exists?(user_id: self.user_id)
        errors[:err_msg] << 'Cannot answer the same question twice'
      end
    end

    def author_answering_question?
      if self.question.poll.author_id == self.user_id
        errors[:err_msg] << "Author cannot answer their own question!"
      end
    end
end

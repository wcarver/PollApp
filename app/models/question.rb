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

  has_many :responses,
    through: :answer_choices,
    source: :responses
    # SELECT
    #   answers.id, COUNT(responses)
    # FROM
    #   questions
    # JOIN
    #   answers ON answers.question_id = questions.id
    # LEFT OUTER JOIN
    #   responses ON responses.answer_id = answers.id
    # WHERE
    #   question_id = 1
    # GROUP BY
    #   answers.id
  def results
    ans_hash = Hash.new(0)
    h = self
      .answer_choices
      .select("answers.body, COUNT(responses.id) AS response_count")
      .joins('left outer join responses on responses.answer_id = answers.id')
      .group("answers.id")
    h.map do |ans|
      ans_hash[ans.body] = ans.response_count
    end
    ans_hash
  end
end

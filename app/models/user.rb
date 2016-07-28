class User < ActiveRecord::Base

  has_many :responses,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'Response'

  has_many :authored_polls,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: 'Poll'
end

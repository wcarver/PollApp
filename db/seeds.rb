# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do

  User.create!(user_name: Faker::Name.name)

end

poll1 = Poll.create!(title: 'Seed poll 1', author_id: 1)
poll2 = Poll.create!(title: 'Seed poll 2', author_id: 1)
poll3 = Poll.create!(title: 'Seed poll 3', author_id: 3)
poll4 = Poll.create!(title: 'Seed poll 4', author_id: 4)


question1 = Question.create!(question_text: 'Question 1', poll_id: 1)
question2 = Question.create!(question_text: 'Question 3', poll_id: 1)
answer1 = Answer.create!(question_id: 1, body: 'Answer 1 for q1')
answer2 = Answer.create!(question_id: 1, body: 'Answer 2 for q1')
response1 = Response.create!(user_id: 2, answer_id: 2)
response2 = Response.create!(user_id: 4, answer_id: 1)


question3 = Question.create!(question_text: 'Question 1', poll_id: 2)
question4 = Question.create!(question_text: 'Question 3', poll_id: 2)
answer3 = Answer.create!(question_id: 3, body: 'Answer 1 for q1')
answer4 = Answer.create!(question_id: 3, body: 'Answer 2 for q1')
response3 = Response.create!(user_id: 7, answer_id: 3)
response4 = Response.create!(user_id: 4, answer_id: 3)

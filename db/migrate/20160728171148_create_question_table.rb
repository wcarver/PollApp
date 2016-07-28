class CreateQuestionTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question_text, null: false
      t.integer :poll_id, null: false
      t.timestamps
    end
  end
end

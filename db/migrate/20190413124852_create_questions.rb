class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :name
      t.string :email
      t.text :question_text
      t.text :answer_text
      t.boolean :closed, default: false

      t.timestamps
    end
  end
end

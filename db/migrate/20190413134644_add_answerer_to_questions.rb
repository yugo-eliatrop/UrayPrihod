class AddAnswererToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :answerer, references: :users
  end
end

class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.datetime :start_at
      t.string :mark
      t.integer :status
      t.references :category, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

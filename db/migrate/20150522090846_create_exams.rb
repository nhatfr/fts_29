class CreateExams < ActiveRecord::Migration
  def change
    create_table :exams do |t|
      t.time :time_complete
      t.integer :mark
      t.integer :status
      t.references :categories, index: true, foreign_key: true
      t.references :users, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

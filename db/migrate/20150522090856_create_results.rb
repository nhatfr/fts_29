class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :questions, index: true, foreign_key: true
      t.references :exams, index: true, foreign_key: true
      t.references :answers, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

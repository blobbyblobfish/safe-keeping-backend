class CreateDiaryCards < ActiveRecord::Migration[6.0]
  def change
    create_table :diary_cards do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.text :thoughts
      t.text :feelings

      t.timestamps
    end
  end
end

class CreateDiaryCardTrackers < ActiveRecord::Migration[6.0]
  def change
    create_table :diary_card_trackers do |t|
      t.belongs_to :diary_card, null: false, foreign_key: true
      t.belongs_to :tracker, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end

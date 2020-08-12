class AddEntryTimestampToDiaryCards < ActiveRecord::Migration[6.0]
  def change
    add_column :diary_cards, :entry_timestamp, :bigint
  end
end

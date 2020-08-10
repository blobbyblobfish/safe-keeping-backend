class CreateCopingSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :coping_skills do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.text :directions
      t.integer :attempts
      t.integer :successful_attempts

      t.timestamps
    end
  end
end

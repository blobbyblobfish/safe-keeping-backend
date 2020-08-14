class CreateUserTherapists < ActiveRecord::Migration[6.0]
  def change
    create_table :user_therapists do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :therapist, null: false, foreign_key: true

      t.timestamps
    end
  end
end

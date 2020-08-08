class CreateEmergencyContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :emergency_contacts do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.string :phone_number
      t.boolean :professional

      t.timestamps
    end
  end
end

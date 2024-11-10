class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthdate
      t.integer :sex
      t.string :address_line1
      t.string :address_line2
      t.string :city
      t.string :state
      t.string :country
      t.integer :phone
      t.string :email
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

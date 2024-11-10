class ChangePhoneToBeStringInPatient < ActiveRecord::Migration[7.0]
  def up
    change_column :patients, :phone, :string
  end
  
  def down
    change_column :patients, :phone, :integer, using: "phone::integer"
  end
  
end

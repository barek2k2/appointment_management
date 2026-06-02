class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :ssn
      t.string :date_of_birth

      t.timestamps
    end
  end
end

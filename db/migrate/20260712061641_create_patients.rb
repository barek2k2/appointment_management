class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :ssn
      t.datetime :dob

      t.timestamps
    end
  end
end

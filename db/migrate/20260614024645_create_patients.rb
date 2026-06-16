class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :country
      t.string :football_team
      t.string :ssn

      t.timestamps
    end
  end
end

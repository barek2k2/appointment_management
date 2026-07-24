class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :ssn
      t.string :soccer_team_name

      t.timestamps
    end
  end
end

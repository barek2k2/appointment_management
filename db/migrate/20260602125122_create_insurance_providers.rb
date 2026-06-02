class CreateInsuranceProviders < ActiveRecord::Migration[7.1]
  def change
    create_table :insurance_providers do |t|
      t.string :name

      t.timestamps
    end
  end
end

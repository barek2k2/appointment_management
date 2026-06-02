class CreateBillingMethods < ActiveRecord::Migration[7.1]
  def change
    create_table :billing_methods do |t|
      t.string :name

      t.timestamps
    end
  end
end

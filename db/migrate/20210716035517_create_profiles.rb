class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :cigar_amount
      t.integer :box_price

      t.timestamps
    end
  end
end

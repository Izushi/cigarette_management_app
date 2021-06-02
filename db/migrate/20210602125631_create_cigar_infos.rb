class CreateCigarInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :cigar_infos do |t|
      t.string :brand
      t.integer :price
      t.text :text
      t.timestamps
    end
  end
end

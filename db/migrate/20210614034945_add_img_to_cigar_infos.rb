class AddImgToCigarInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :cigar_infos, :img, :string
  end
end

class AddUserIdToCigarInfos < ActiveRecord::Migration[5.2]
  def change
    add_reference :cigar_infos, :user, foreign_key: true
  end
end

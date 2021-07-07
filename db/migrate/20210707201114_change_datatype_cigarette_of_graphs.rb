class ChangeDatatypeCigaretteOfGraphs < ActiveRecord::Migration[5.2]
  def change
    change_column :graphs, :cigarette, :integer
  end
end

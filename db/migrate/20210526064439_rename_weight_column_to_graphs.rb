class RenameWeightColumnToGraphs < ActiveRecord::Migration[5.2]
  def change
    rename_column :graphs, :weight, :cigarette
  end
end

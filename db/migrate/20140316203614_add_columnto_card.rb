class AddColumntoCard < ActiveRecord::Migration
  def change
  	add_column :cards, :game, :integer
  end
end

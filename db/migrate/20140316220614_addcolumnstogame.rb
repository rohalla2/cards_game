class Addcolumnstogame < ActiveRecord::Migration
  def change
  	remove_column :games, :player_id
  	add_column :games, :name, :string
  	add_column :games, :code, :string
  end
end

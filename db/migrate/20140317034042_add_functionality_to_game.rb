class AddFunctionalityToGame < ActiveRecord::Migration
  def change
  	add_column :games, :game_status, :string
  	add_column :games, :player_choosing, :string
  end
end

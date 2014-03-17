class AddOpenToGame < ActiveRecord::Migration
  def change
  	add_column :games, :closed, :boolean
  end
end

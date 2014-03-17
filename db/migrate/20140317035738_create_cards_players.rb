class CreateCardsPlayers < ActiveRecord::Migration
  def change
    create_table :cards_players do |t|
      t.references :card, index: true
      t.references :player, index: true
      t.references :game
      t.timestamps
    end
  end
end
